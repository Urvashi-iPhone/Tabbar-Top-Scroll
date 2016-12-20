# Makefile
.PHONY: build

PROJECT = NKJPagerViewController.xcodeproj
SCHEME_TARGET = NKJPagerViewController
TEST_TARGET = NKJPagerViewControllerTests

clean:
	xcodebuild \
		-project $(PROJECT) \
		clean

build:
	xcodebuild \
		-project $(PROJECT) \
		-scheme $(SCHEME_TARGET) \
		build \
		-sdk iphoneos \
		-configuration Debug \
		TEST_AFTER_BUILD=YES \
		| xcpretty -c

test2:
	xctool \
		-configuration Debug \
		-sdk iphonesimulator \
		-project $(PROJECT) \
		-scheme $(SCHEME_TARGET) \
		test -only $(TEST_TARGET) \
		-parallelize -freshSimulator -freshInstall --showTasks \
		TEST_HOST= \
		TEST_AFTER_BUILD=YES

test:
	xcodebuild test \
		-project $(PROJECT) \
		-scheme $(SCHEME_TARGET) \
		-destination-timeout 1 \
		-sdk iphonesimulator8.1 \
		-configuration Debug \
		-destination 'name=iPhone 6' 

