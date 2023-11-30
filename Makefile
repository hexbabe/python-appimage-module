# Makefile
IMAGE_NAME = appimage-builder-viam-python-example
CONTAINER_NAME = appimage-builder-viam-python-example
AARCH64_APPIMAGE_NAME = python-appimage-example--aarch64.AppImage

# Developing
default:
	@echo No make target specified.

# Packaging
build: appimage-aarch64

non-appimage: clean  # builds tarball from source that runs using venv
	tar -czf module.tar.gz run.sh requirements.txt src

appimage-aarch64: clean
	docker build -f packaging/Dockerfile -t $(IMAGE_NAME) .
	docker run --name $(CONTAINER_NAME) $(IMAGE_NAME)
	docker cp $(CONTAINER_NAME):/app/$(AARCH64_APPIMAGE_NAME) ./$(AARCH64_APPIMAGE_NAME)
	chmod +x ${AARCH64_APPIMAGE_NAME}
	tar -czf module.tar.gz run.sh $(AARCH64_APPIMAGE_NAME)

clean:
	rm -f $(AARCH64_APPIMAGE_NAME)
	rm -f module.tar.gz
	docker container stop $(CONTAINER_NAME) || true
	docker container rm $(CONTAINER_NAME) || true
