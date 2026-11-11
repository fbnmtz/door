# Building the DOOR ISO

The ISO builder and Arch package recipes live in this repository under
[`iso/`](../iso/) and [`packages/`](../packages/). The Archiso source used by
the builder is vendored at `iso/archiso/` and retains its upstream license.
It is pinned to Archiso commit
`424e78130db2af6c1ceb55b442d7914b1109ff2b`.

## Requirements

Build on Linux with Docker configured to run privileged containers, at least
50 GB of free disk space, and access to the configured package mirrors.

## Build

From the repository root, run:

```bash
bash scripts/door-iso-make.sh --no-boot-offer --keep-pkg-cache
```

The build uses this checkout as the local runtime source and `packages/` as the
local package-recipe source. The default target is `x86_64`; pass
`--arch aarch64` to build for ARM. The generated ISO is written to
`iso/release/`.

The imported builder and package recipes still use upstream Omarchy package
names and package mirrors. Until those are migrated, treat this as a
development build, not a release-ready DOOR installer.

The manual GitHub Actions workflow uses a self-hosted Linux runner labeled
`door-iso` with Docker and at least 50 GB of free disk space. It only uploads
the resulting ISO as a temporary artifact; it does not publish or sign release
images.
