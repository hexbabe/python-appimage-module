# python-appimage-module

This is an example of using AppImageBuilder to bundle a Python module as an AppImage (only supported on AArch64 for now), and then running it on a robot.

Use this as a reference for:
- An alternative to managing Python version/dependencies directly

## Robot config

Replace `module_id` and `model` with the values you choose for your module.

```json
TODO: add example config after the module is on the registry
```

## Quick tour of this repo

- `packaging/`: The directory containing the Dockerfile that configures the Docker image for the builder, the AppImageBuilder.yml config file, and the icon
- `src/`: Python code for the Viam module
- `Makefile`: `make` commands to build the module in different ways
- `meta.json`: The metadata config file used when uploading/updating module info on the registry
- `requirements.txt`: List of Python dependencies
- `run.sh`: The entrypoint execution script that starts up the module process

## Forking this repo

If you fork this and want to deploy to a robot, you'll need to change all placeholder variables, references to 'viam', and optionally set up secrets for CI. Follow the [fork instructions](https://github.com/viam-labs/python-example-module#forking-this-repo) from the Python example repo.
