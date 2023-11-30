# python-appimage-module

This is an example of using AppImageBuilder to bundle a Python module as an AppImage (only supported on AArch64 for now), and then running it on a robot.

Use this as a reference for:
- An alternative to managing Python version/dependencies directly for your robot.

## Robot config

Replace `module_id` and `model` with the values you choose for your module.

```json
TODO: add example config after the module is on the registry
```

## Quick tour of this repo

- `packaging/`: the directory containing the Dockerfile that configures the Docker image to run the builder in, the AppImageBuilder.yml config file, and the icon. You must have Docker installed before running the build.
- `src/`: Python module code for the Viam module
- `Makefile`: `make` commands to build the module in different ways
- `meta.json`: the metadata config file used when uploading/updating module info on the registry
- `requirements.txt`: list of Python packages the module depends on
- `run.sh`: the entrypoint execution script that starts up the module process

## Using this repo as boilerplate

If you fork this and want to deploy to a robot, you'll need to change all placeholder names and references to the [viam namespace](https://docs.viam.com/appendix/glossary/#term-model-namespace-triplet). Follow the [fork instructions](https://github.com/viam-labs/python-example-module#forking-this-repo) from the Python example repo.

If you aren't making a camera module, you may want to use a different component's repo along with this repo as boilerplate in place of the `src` folder. When doing this, make sure to maintain the structure of a Python module i.e. keeping the outermost `__init__.py` to ensure the build doesn't break. Moreover, in this case, be sure to update your `meta.json` with the updated models.
