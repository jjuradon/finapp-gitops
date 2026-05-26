# ADR 001: Start as a Modular Monolith

## Status
Approved

## Context
We are bootstrapping the FamilyFinance application, a personal and family budget management app targeting single users, couples, and families. The initial target environment is a self-hosted home lab. 

Building a fully distributed microservices architecture from day one adds substantial operational overhead, including distributed tracing, service discovery, complex networking, and event-driven data consistency concerns (Sagas/Outbox orchestration).

## Decision
We will start Phase 1 of the application as a **modular monolith**. 
- All six core modules (`auth_household`, `account`, `transaction`, `planning`, `categorisation`, `analytics`) will run within a single FastAPI process.
- We will use a single PostgreSQL instance with a separate schema per module to enforce database isolation.
- Per-module database users will have permissions scoped strictly to their respective schemas.
- In-process module communication must only occur through each module's public `services/` layer interface.

## Rationale
- **Low Operational Overhead:** Ideal for single-instance home lab deployment.
- **Velocity:** Simpler development, debugging, and testing loop compared to distributed services.
- **Extraction Ready:** By enforcing strict boundaries (no cross-module repository or database imports) from day one, we can extract modules into standalone microservices (Phase 2) without structural code rework when scaling or ownership boundaries demand it.

## Alternatives Considered
- **Full Microservices from Day One:** Rejected because the distributed systems overhead outweighs the benefits at this stage of the project.

## Consequences
- Developers must respect the layer import contract (enforced via linters and documented in `CONTRIBUTING.md`).
- Schema migrations must be managed separately per module.
- Refactoring internal APIs requires care to ensure public boundaries are preserved.
