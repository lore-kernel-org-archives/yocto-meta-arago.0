Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6839.1637640070691133283
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 Nov 2021 20:01:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2D94A40C8A;
	Tue, 23 Nov 2021 04:01:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a5eAKbLsHm4I; Tue, 23 Nov 2021 04:01:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0C4B640C8F;
	Tue, 23 Nov 2021 04:01:08 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id DB0AE1746E0;
	Mon, 22 Nov 2021 23:01:04 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: j-humphreys@ti.com,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [tisdk-build-scripts][PATCH 00/10] Build scripts simplification/cleanup pass #1
Date: Mon, 22 Nov 2021 23:00:49 -0500
Message-Id: <1637640060-31733-13-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637640060-31733-1-git-send-email-denis@denix.org>
References: <1637640060-31733-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

tisdk-build-scripts project has started almost 10 years ago and initially
was envisioned as a dedicated CI vehicle, supporting OpenEmbedded and
Debian/Ubuntu, handling parallel and serial multi-machine builds, runtime
target testing, SDK installer packaging, detailed reporting tool, etc.

Over the years, a lot of that functionality has migrated to dedicated
facilities and frameworks (Jenkins build farm, OpenTest testing farm,
Django reporting portal, etc), so it is time to clean it up and simplify
a lot of things to make the code easy to read, understand and maintain.

Denys Dmytriyenko (10):
  Remove very old debian/ubuntu build scripts and configs
  Remove old webgen makefiles for very old AMSDK and CoreSDK releases
  Remove rudimentary target testing with OpenTest CLI
  Remove very old build config files
  Remove support for generating installer SDK
  Remove code that extracts and repackages SDK for runtime testing
  Remove ability to generate build/test report per machine
  Remove calls to packaging, reporting, testing and copying
    functionality
  If no configs specified, initialize LOG_DIR correctly
  Adjust default BUILD_DIR to be relative to SCRIPTS_DIR

 build-oesdk.sh                                     |  52 +--
 build-ubuntu-environment.sh                        | 194 --------
 configs/amsdk/amsdk-config-05.06.00.00.txt         | 288 ------------
 configs/amsdk/amsdk-config-05.07.00.00.txt         | 303 -------------
 configs/amsdk/amsdk-config-06.00.00.00.txt         | 314 -------------
 configs/amsdk/amsdk-config-07.00.00.00.txt         | 314 -------------
 configs/amsdk/amsdk-config-07.01.00.00.txt         | 314 -------------
 configs/amsdk/amsdk-config-08.00.00.00.txt         | 318 -------------
 configs/arago-core-tisdk-daisy-puget.txt           | 333 --------------
 configs/arago-core-tisdk-danny-puget.txt           | 315 -------------
 configs/arago-core-tisdk-dora-puget.txt            | 315 -------------
 configs/arago-core-tisdk-dylan-puget.txt           | 315 -------------
 configs/arago-core-tisdk-fido-puget.txt            | 337 --------------
 configs/arago-core-tisdk-krogoth-farm.txt          | 340 --------------
 configs/arago-core-tisdk-krogoth-puget.txt         | 340 --------------
 configs/arago-core-tisdk-master-puget.txt          | 337 --------------
 configs/coresdk/arago-core-amsdk-2013.04.01.txt    | 323 --------------
 configs/coresdk/arago-core-tisdk-2013.04.00.txt    | 323 --------------
 configs/coresdk/arago-core-tisdk-2013.04.01.txt    | 323 --------------
 configs/coresdk/arago-core-tisdk-2013.04.02.txt    | 323 --------------
 configs/coresdk/arago-core-tisdk-2013.10.00.txt    | 314 -------------
 configs/coresdk/arago-core-tisdk-2013.12.00.txt    | 314 -------------
 configs/coresdk/arago-core-tisdk-2013.12.01.txt    | 314 -------------
 configs/coresdk/arago-core-tisdk-2014.08.00.txt    | 318 -------------
 configs/coresdk/arago-core-tisdk-2014.10.01.txt    | 318 -------------
 configs/coresdk/arago-core-tisdk-2014.10.02.txt    | 321 -------------
 configs/coresdk/arago-core-tisdk-2015.01-puget.txt | 333 --------------
 configs/coresdk/arago-core-tisdk-2015.02-puget.txt | 333 --------------
 configs/coresdk/arago-core-tisdk-2015.03-puget.txt | 337 --------------
 configs/distroless-meta-ti-puget.txt               | 308 -------------
 configs/farm/arago-dunfell-next.txt                |   2 +-
 configs/farm/arago-dunfell.txt                     |   2 +-
 configs/farm/arago-krogoth.txt                     | 344 --------------
 configs/farm/arago-master.txt                      |   2 +-
 configs/farm/arago-morty-next-rel.txt              | 344 --------------
 configs/farm/arago-morty-next.txt                  | 344 --------------
 configs/farm/arago-morty.txt                       | 344 --------------
 configs/farm/arago-rocko-next.txt                  | 346 --------------
 configs/farm/arago-rocko.txt                       | 346 --------------
 configs/farm/arago-thud-next.txt                   | 349 ---------------
 configs/farm/arago-thud.txt                        | 349 ---------------
 configs/farm/arago-zeus-next.txt                   | 346 --------------
 configs/farm/arago-zeus.txt                        | 346 --------------
 configs/farm/distroless-dunfell.txt                |   2 +-
 configs/farm/distroless-master.txt                 |   2 +-
 configs/farm/distroless-morty.txt                  | 196 --------
 configs/farm/distroless-rocko.txt                  | 196 --------
 configs/farm/distroless-thud.txt                   | 198 --------
 configs/farm/distroless-zeus.txt                   | 198 --------
 configs/farm/poky-dunfell.txt                      |   2 +-
 configs/farm/poky-master.txt                       |   2 +-
 configs/farm/poky-morty.txt                        | 196 --------
 configs/farm/poky-rocko.txt                        | 196 --------
 configs/farm/poky-thud.txt                         | 198 --------
 configs/farm/poky-zeus.txt                         | 198 --------
 configs/target-debconf-selections.txt              | 212 ---------
 configs/ubuntu-environment-creation.conf           | 162 -------
 installer-files/tisdk.xml                          | 220 ---------
 lib/oesdk/bitbake-test-sdk-image                   | 381 ----------------
 lib/oesdk/generate-report                          | 295 ------------
 lib/oesdk/package-sdks                             | 496 ---------------------
 lib/oesdk/ti-sdk-host-install.sh                   | 227 ----------
 lib/run-opentest                                   | 375 ----------------
 lib/ubuntu/apt-helper-functions                    |  20 -
 lib/ubuntu/create-target-files                     |  51 ---
 lib/ubuntu/create-ubuntu-host-chroot.sh            |  77 ----
 lib/ubuntu/do-bind-mounts.sh                       |  22 -
 lib/ubuntu/kernel-build.sh                         |  46 --
 lib/ubuntu/run-opentest-on-target-image            |  35 --
 lib/ubuntu/sudo-check                              |   5 -
 lib/ubuntu/use-armhf-pbuilder.sh                   | 117 -----
 linux-devtest.tgz                                  | Bin 775952 -> 0 bytes
 opentest_cli_0.7.tar.gz                            | Bin 482035 -> 0 bytes
 .../amsdk/05.06.00.00/am335x-evm/webgen.mak        |  33 --
 .../amsdk/05.07.00.00/am180x-evm/webgen.mak        |  29 --
 .../amsdk/05.07.00.00/am335x-evm/webgen.mak        |  32 --
 .../amsdk/05.07.00.00/am3517-evm/webgen.mak        |  31 --
 .../amsdk/05.07.00.00/am37x-evm/webgen.mak         |  31 --
 .../amsdk/05.07.00.00/beagleboard/webgen.mak       |  29 --
 .../amsdk/06.00.00.00/am180x-evm/webgen.mak        |  29 --
 .../amsdk/06.00.00.00/am335x-evm/webgen.mak        |  34 --
 .../amsdk/06.00.00.00/am3517-evm/webgen.mak        |  31 --
 .../amsdk/06.00.00.00/am37x-evm/webgen.mak         |  31 --
 .../amsdk/06.00.00.00/beagleboard/webgen.mak       |  29 --
 .../amsdk/07.00.00.00/am335x-evm/webgen.mak        |  39 --
 .../amsdk/07.00.00.00/am437x-evm/webgen.mak        |  36 --
 .../amsdk/07.01.00.00/am437x-evm/webgen.mak        |  38 --
 .../amsdk/08.00.00.00/am335x-evm/webgen.mak        |  39 --
 .../amsdk/08.00.00.00/am437x-evm/webgen.mak        |  40 --
 .../amsdk/08.00.00.00/am57xx-evm/webgen.mak        |  38 --
 .../coresdk/2013.04.00/am335x-evm/webgen.mak       |  29 --
 .../coresdk/2013.04.00/dra7xx-evm/webgen.mak       |  27 --
 .../coresdk/2013.04.00/omap5-evm/webgen.mak        |  26 --
 .../coresdk/2013.04.01/am335x-evm/webgen.mak       |  29 --
 .../coresdk/2013.04.02/dra7xx-evm/webgen.mak       |  27 --
 .../coresdk/2013.04.02/omap5-evm/webgen.mak        |  26 --
 .../coresdk/2013.10.00/am335x-evm/webgen.mak       |  29 --
 .../coresdk/2013.10.00/am437x-evm/webgen.mak       |  29 --
 .../coresdk/2013.10.00/dra7xx-evm/webgen.mak       |  29 --
 .../coresdk/2013.10.00/omap5-evm/webgen.mak        |  28 --
 .../coresdk/2013.12.00/am335x-evm/webgen.mak       |  29 --
 .../coresdk/2013.12.00/am437x-evm/webgen.mak       |  29 --
 .../coresdk/2013.12.00/dra7xx-evm/webgen.mak       |  29 --
 .../coresdk/2013.12.00/omap5-evm/webgen.mak        |  28 --
 .../coresdk/2013.12.01/am335x-evm/webgen.mak       |  29 --
 .../coresdk/2013.12.01/am437x-evm/webgen.mak       |  29 --
 .../coresdk/2013.12.01/dra7xx-evm/webgen.mak       |  29 --
 .../coresdk/2013.12.01/omap5-evm/webgen.mak        |  28 --
 .../coresdk/2014.08.00/am335x-evm/webgen.mak       |  28 --
 .../coresdk/2014.08.00/am437x-evm/webgen.mak       |  28 --
 .../coresdk/2014.08.00/am57xx-evm/webgen.mak       |  28 --
 .../coresdk/2014.08.00/dra7xx-evm/webgen.mak       |  28 --
 .../coresdk/2014.08.00/k2hk-evm/webgen.mak         |  28 --
 .../coresdk/2014.10.01/am335x-evm/webgen.mak       |  28 --
 .../coresdk/2014.10.01/am437x-evm/webgen.mak       |  28 --
 .../coresdk/2014.10.01/am57xx-evm/webgen.mak       |  28 --
 .../coresdk/2014.10.01/dra7xx-evm/webgen.mak       |  28 --
 .../coresdk/2014.10.01/k2hk-evm/webgen.mak         |  28 --
 .../coresdk/2015.01/am335x-evm/webgen.mak          |  28 --
 .../coresdk/2015.01/am437x-evm/webgen.mak          |  28 --
 .../coresdk/2015.01/am57xx-evm/webgen.mak          |  28 --
 .../coresdk/2015.01/dra7xx-evm/webgen.mak          |  28 --
 .../coresdk/2015.01/k2e-evm/webgen.mak             |  28 --
 .../coresdk/2015.01/k2hk-evm/webgen.mak            |  28 --
 .../coresdk/2015.01/k2l-evm/webgen.mak             |  28 --
 .../coresdk/2015.02/am335x-evm/webgen.mak          |  28 --
 .../coresdk/2015.02/am437x-evm/webgen.mak          |  28 --
 .../coresdk/2015.02/am57xx-evm/webgen.mak          |  28 --
 .../coresdk/2015.02/dra7xx-evm/webgen.mak          |  28 --
 .../coresdk/2015.02/k2e-evm/webgen.mak             |  28 --
 .../coresdk/2015.02/k2g-evm/webgen.mak             |  28 --
 .../coresdk/2015.02/k2hk-evm/webgen.mak            |  28 --
 .../coresdk/2015.02/k2l-evm/webgen.mak             |  28 --
 test-scripts/S08-fake-weston-calibrate             |   6 -
 test-scripts/S90-fake-pointercal                   |  12 -
 test-scripts/boottest.sh                           |   3 -
 test-scripts/check-dhrystone-perf.sh               |  25 --
 test-scripts/check-kernel-version.sh               |  12 -
 test-scripts/check-launch.sh                       | 121 -----
 test-scripts/check-linpack-perf.sh                 |  31 --
 test-scripts/check-matrix-gui.sh                   |  12 -
 test-scripts/check-psp-version.sh                  |  12 -
 test-scripts/check-whetstone-perf.sh               |  30 --
 test-scripts/check_app.sh                          |  94 ----
 test-scripts/common.sh                             |  88 ----
 test-scripts/nightly-test.sh                       |  93 ----
 test-scripts/opentest.sh                           |   3 -
 test-scripts/st_log.sh                             | 120 -----
 test-scripts/test-files/mandatory-common.txt       |   1 -
 .../test-files/mandatory-oesdk-am180x-evm.txt      |   1 -
 .../test-files/mandatory-oesdk-am3517-evm.txt      |   1 -
 .../test-files/mandatory-oesdk-am37x-evm.txt       |   1 -
 test-scripts/test-files/mandatory-oesdk-armv7a.txt |   1 -
 .../test-files/mandatory-oesdk-beagleboard.txt     |   1 -
 test-scripts/test-files/mandatory-oesdk.txt        |   7 -
 .../test-files/optional-oesdk-am180x-evm.txt       |   2 -
 .../test-files/optional-oesdk-am3517-evm.txt       |   2 -
 .../test-files/optional-oesdk-am37x-evm.txt        |   2 -
 test-scripts/test-files/optional-oesdk-armv7a.txt  |   4 -
 .../test-files/optional-oesdk-beagleboard.txt      |   1 -
 .../test-files/optional-oesdk-dra7xx-evm.txt       |   1 -
 .../test-files/optional-oesdk-omap5-evm.txt        |   1 -
 test-scripts/test-files/optional-oesdk.txt         |  11 -
 163 files changed, 12 insertions(+), 19485 deletions(-)
 delete mode 100755 build-ubuntu-environment.sh
 delete mode 100644 configs/amsdk/amsdk-config-05.06.00.00.txt
 delete mode 100644 configs/amsdk/amsdk-config-05.07.00.00.txt
 delete mode 100644 configs/amsdk/amsdk-config-06.00.00.00.txt
 delete mode 100644 configs/amsdk/amsdk-config-07.00.00.00.txt
 delete mode 100644 configs/amsdk/amsdk-config-07.01.00.00.txt
 delete mode 100644 configs/amsdk/amsdk-config-08.00.00.00.txt
 delete mode 100644 configs/arago-core-tisdk-daisy-puget.txt
 delete mode 100644 configs/arago-core-tisdk-danny-puget.txt
 delete mode 100644 configs/arago-core-tisdk-dora-puget.txt
 delete mode 100644 configs/arago-core-tisdk-dylan-puget.txt
 delete mode 100644 configs/arago-core-tisdk-fido-puget.txt
 delete mode 100644 configs/arago-core-tisdk-krogoth-farm.txt
 delete mode 100644 configs/arago-core-tisdk-krogoth-puget.txt
 delete mode 100644 configs/arago-core-tisdk-master-puget.txt
 delete mode 100644 configs/coresdk/arago-core-amsdk-2013.04.01.txt
 delete mode 100644 configs/coresdk/arago-core-tisdk-2013.04.00.txt
 delete mode 100644 configs/coresdk/arago-core-tisdk-2013.04.01.txt
 delete mode 100644 configs/coresdk/arago-core-tisdk-2013.04.02.txt
 delete mode 100644 configs/coresdk/arago-core-tisdk-2013.10.00.txt
 delete mode 100644 configs/coresdk/arago-core-tisdk-2013.12.00.txt
 delete mode 100644 configs/coresdk/arago-core-tisdk-2013.12.01.txt
 delete mode 100644 configs/coresdk/arago-core-tisdk-2014.08.00.txt
 delete mode 100644 configs/coresdk/arago-core-tisdk-2014.10.01.txt
 delete mode 100644 configs/coresdk/arago-core-tisdk-2014.10.02.txt
 delete mode 100644 configs/coresdk/arago-core-tisdk-2015.01-puget.txt
 delete mode 100644 configs/coresdk/arago-core-tisdk-2015.02-puget.txt
 delete mode 100644 configs/coresdk/arago-core-tisdk-2015.03-puget.txt
 delete mode 100644 configs/distroless-meta-ti-puget.txt
 delete mode 100644 configs/farm/arago-krogoth.txt
 delete mode 100644 configs/farm/arago-morty-next-rel.txt
 delete mode 100644 configs/farm/arago-morty-next.txt
 delete mode 100644 configs/farm/arago-morty.txt
 delete mode 100644 configs/farm/arago-rocko-next.txt
 delete mode 100644 configs/farm/arago-rocko.txt
 delete mode 100644 configs/farm/arago-thud-next.txt
 delete mode 100644 configs/farm/arago-thud.txt
 delete mode 100644 configs/farm/arago-zeus-next.txt
 delete mode 100644 configs/farm/arago-zeus.txt
 delete mode 100644 configs/farm/distroless-morty.txt
 delete mode 100644 configs/farm/distroless-rocko.txt
 delete mode 100644 configs/farm/distroless-thud.txt
 delete mode 100644 configs/farm/distroless-zeus.txt
 delete mode 100644 configs/farm/poky-morty.txt
 delete mode 100644 configs/farm/poky-rocko.txt
 delete mode 100644 configs/farm/poky-thud.txt
 delete mode 100644 configs/farm/poky-zeus.txt
 delete mode 100644 configs/target-debconf-selections.txt
 delete mode 100644 configs/ubuntu-environment-creation.conf
 delete mode 100644 installer-files/tisdk.xml
 delete mode 100644 lib/oesdk/generate-report
 delete mode 100644 lib/oesdk/package-sdks
 delete mode 100755 lib/oesdk/ti-sdk-host-install.sh
 delete mode 100644 lib/run-opentest
 delete mode 100644 lib/ubuntu/apt-helper-functions
 delete mode 100644 lib/ubuntu/create-target-files
 delete mode 100755 lib/ubuntu/create-ubuntu-host-chroot.sh
 delete mode 100755 lib/ubuntu/do-bind-mounts.sh
 delete mode 100755 lib/ubuntu/kernel-build.sh
 delete mode 100644 lib/ubuntu/run-opentest-on-target-image
 delete mode 100644 lib/ubuntu/sudo-check
 delete mode 100755 lib/ubuntu/use-armhf-pbuilder.sh
 delete mode 100644 linux-devtest.tgz
 delete mode 100644 opentest_cli_0.7.tar.gz
 delete mode 100644 publish-sdk-data/amsdk/05.06.00.00/am335x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/amsdk/05.07.00.00/am180x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/amsdk/05.07.00.00/am335x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/amsdk/05.07.00.00/am3517-evm/webgen.mak
 delete mode 100644 publish-sdk-data/amsdk/05.07.00.00/am37x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/amsdk/05.07.00.00/beagleboard/webgen.mak
 delete mode 100644 publish-sdk-data/amsdk/06.00.00.00/am180x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/amsdk/06.00.00.00/am335x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/amsdk/06.00.00.00/am3517-evm/webgen.mak
 delete mode 100644 publish-sdk-data/amsdk/06.00.00.00/am37x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/amsdk/06.00.00.00/beagleboard/webgen.mak
 delete mode 100644 publish-sdk-data/amsdk/07.00.00.00/am335x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/amsdk/07.00.00.00/am437x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/amsdk/07.01.00.00/am437x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/amsdk/08.00.00.00/am335x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/amsdk/08.00.00.00/am437x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/amsdk/08.00.00.00/am57xx-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.04.00/am335x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.04.00/dra7xx-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.04.00/omap5-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.04.01/am335x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.04.02/dra7xx-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.04.02/omap5-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.10.00/am335x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.10.00/am437x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.10.00/dra7xx-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.10.00/omap5-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.12.00/am335x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.12.00/am437x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.12.00/dra7xx-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.12.00/omap5-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.12.01/am335x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.12.01/am437x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.12.01/dra7xx-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.12.01/omap5-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2014.08.00/am335x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2014.08.00/am437x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2014.08.00/am57xx-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2014.08.00/dra7xx-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2014.08.00/k2hk-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2014.10.01/am335x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2014.10.01/am437x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2014.10.01/am57xx-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2014.10.01/dra7xx-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2014.10.01/k2hk-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2015.01/am335x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2015.01/am437x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2015.01/am57xx-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2015.01/dra7xx-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2015.01/k2e-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2015.01/k2hk-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2015.01/k2l-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2015.02/am335x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2015.02/am437x-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2015.02/am57xx-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2015.02/dra7xx-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2015.02/k2e-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2015.02/k2g-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2015.02/k2hk-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2015.02/k2l-evm/webgen.mak
 delete mode 100755 test-scripts/S08-fake-weston-calibrate
 delete mode 100755 test-scripts/S90-fake-pointercal
 delete mode 100755 test-scripts/boottest.sh
 delete mode 100755 test-scripts/check-dhrystone-perf.sh
 delete mode 100755 test-scripts/check-kernel-version.sh
 delete mode 100755 test-scripts/check-launch.sh
 delete mode 100755 test-scripts/check-linpack-perf.sh
 delete mode 100755 test-scripts/check-matrix-gui.sh
 delete mode 100755 test-scripts/check-psp-version.sh
 delete mode 100755 test-scripts/check-whetstone-perf.sh
 delete mode 100755 test-scripts/check_app.sh
 delete mode 100755 test-scripts/common.sh
 delete mode 100755 test-scripts/nightly-test.sh
 delete mode 100755 test-scripts/opentest.sh
 delete mode 100755 test-scripts/st_log.sh
 delete mode 100644 test-scripts/test-files/mandatory-common.txt
 delete mode 100644 test-scripts/test-files/mandatory-oesdk-am180x-evm.txt
 delete mode 100644 test-scripts/test-files/mandatory-oesdk-am3517-evm.txt
 delete mode 100644 test-scripts/test-files/mandatory-oesdk-am37x-evm.txt
 delete mode 100644 test-scripts/test-files/mandatory-oesdk-armv7a.txt
 delete mode 100644 test-scripts/test-files/mandatory-oesdk-beagleboard.txt
 delete mode 100644 test-scripts/test-files/mandatory-oesdk.txt
 delete mode 100644 test-scripts/test-files/optional-oesdk-am180x-evm.txt
 delete mode 100644 test-scripts/test-files/optional-oesdk-am3517-evm.txt
 delete mode 100644 test-scripts/test-files/optional-oesdk-am37x-evm.txt
 delete mode 100644 test-scripts/test-files/optional-oesdk-armv7a.txt
 delete mode 100644 test-scripts/test-files/optional-oesdk-beagleboard.txt
 delete mode 100644 test-scripts/test-files/optional-oesdk-dra7xx-evm.txt
 delete mode 100644 test-scripts/test-files/optional-oesdk-omap5-evm.txt
 delete mode 100644 test-scripts/test-files/optional-oesdk.txt

-- 
2.7.4

