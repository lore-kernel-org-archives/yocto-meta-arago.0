Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 78B9852AB7
	for <meta-arago@arago-project.org>;
	Fri,  1 May 2015 14:10:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t41EAUc6018564
	for <meta-arago@arago-project.org>; Fri, 1 May 2015 09:10:30 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t41EATbj029180
	for <meta-arago@arago-project.org>; Fri, 1 May 2015 09:10:29 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 1 May 2015 09:10:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t41EATs5012663	for
	<meta-arago@arago-project.org>; Fri, 1 May 2015 09:10:29 -0500
Date: Fri, 1 May 2015 10:10:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20150501141029.GX29290@edge>
References: <1480745164.301.1430449311116.JavaMail.jenkins@puget>
MIME-Version: 1.0
In-Reply-To: <1480745164.301.1430449311116.JavaMail.jenkins@puget>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [nightly] Core TISDK 2015.04 build 2015-04-30_22-00-51
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Fri, 01 May 2015 14:10:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

All,

And I'm seeing the same md5 checksum issue again, even though using bitbake 
1.24 (as we suspected bitbake 1.26 being the culprit)... Anyone else besides 
myself and Sam seeing this?

During tisdk-rootfs-image do_rootfs task:

Collected errors:
 * opkg_install_pkg: Package packagegroup-arago-console md5sum mismatch. Either the opkg or the package index are corrupt. Try 'opkg update'.
 * opkg_install_cmd: Cannot install package packagegroup-arago-console.
 * opkg_install_pkg: Package matrix-multimedia-demo-mpeg4dec md5sum mismatch. Either the opkg or the package index are corrupt. Try 'opkg update'.
 * opkg_install_cmd: Cannot install package packagegroup-arago-tisdk-matrix.
 * opkg_install_pkg: Package packagegroup-arago-base md5sum mismatch. Either the opkg or the package index are corrupt. Try 'opkg update'.
 * opkg_install_cmd: Cannot install package packagegroup-arago-base.

-- 
Denys


On Thu, Apr 30, 2015 at 11:01:51PM -0400, Denys Dmytriyenko wrote:
> Status for 04/30/15
> 
> BUILD_ID: build-2015-04-30_22-01-58
> 
> Clean Build: false
> 
> Clean Sources: false
> 
> Repository Revisions
> 
> +------------------------------------------------------------------------------------------------------------------------------------------+
> |   Repository    |                     Git URL                     |Branch|Commit|                         Layers                         |
> |                 |                                                 |      |  ID  |                                                        |
> |-----------------+-------------------------------------------------+------+------+--------------------------------------------------------|
> |bitbake          |git://git.openembedded.org/bitbake               |1.24  |HEAD  |layers=                                                 |
> |-----------------+-------------------------------------------------+------+------+--------------------------------------------------------|
> |meta-arago       |git://arago-project.org/git/meta-arago.git       |master|HEAD  |layers=meta-arago-distro:meta-arago-extras              |
> |-----------------+-------------------------------------------------+------+------+--------------------------------------------------------|
> |meta-qt5         |git://github.com/meta-qt5/meta-qt5.git           |master|HEAD  |layers=                                                 |
> |-----------------+-------------------------------------------------+------+------+--------------------------------------------------------|
> |meta-openembedded|git://git.openembedded.org/meta-openembedded     |daisy |HEAD  |layers=toolchain-layer:meta-networking:meta-ruby:meta-oe|
> |-----------------+-------------------------------------------------+------+------+--------------------------------------------------------|
> |meta-ti          |git://arago-project.org/git/meta-ti.git          |daisy |HEAD  |layers=                                                 |
> |-----------------+-------------------------------------------------+------+------+--------------------------------------------------------|
> |meta-linaro      |git://git.linaro.org/openembedded/meta-linaro.git|daisy |HEAD  |layers=meta-linaro-toolchain                            |
> |-----------------+-------------------------------------------------+------+------+--------------------------------------------------------|
> |oe-core          |git://git.openembedded.org/openembedded-core     |daisy |HEAD  |layers=meta                                             |
> +------------------------------------------------------------------------------------------------------------------------------------------+
> 
> Build and Target Test Results
> 
>    +------------------------------------------+
>    | Machine  |Build Result|Target Test Result|
>    |----------+------------+------------------|
>    |am335x-evm|FAILED      |SKIPPED           |
>    |----------+------------+------------------|
>    |am437x-evm|FAILED      |SKIPPED           |
>    |----------+------------+------------------|
>    |dra7xx-evm|FAILED      |SKIPPED           |
>    |----------+------------+------------------|
>    |am57xx-evm|FAILED      |SKIPPED           |
>    |----------+------------+------------------|
>    |omap5-evm |FAILED      |SKIPPED           |
>    |----------+------------+------------------|
>    |k2hk-evm  |PASSED      |FAILED: CRITICAL  |
>    |----------+------------+------------------|
>    |k2e-evm   |PASSED      |FAILED: CRITICAL  |
>    |----------+------------+------------------|
>    |k2l-evm   |PASSED      |FAILED: CRITICAL  |
>    +------------------------------------------+
> 
>    These builds were performed using the build-oesdk.sh script at:
> 
>    git://arago-project.org/git/projects/tisdk-build-scripts.git
> 
>    The configuration file passed to this script had the contents:
> 
>    MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID
>    SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER
>    SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR
>    TISDK_VERSION"
>    TISDK_VERSION="2015.04"
>    MACHINES="am335x-evm am437x-evm dra7xx-evm am57xx-evm omap5-evm k2hk-evm
>    k2e-evm k2l-evm"
>    NUM_ARM9_BUILDS="1"
>    NUM_CORTEX_BUILDS="1"
>    TOOLCHAIN_ROOT_ARM9="/opt/arago-2011.09/armv5te/bin/"
>    TOOLCHAIN_ROOT_CORTEX="/opt/linaro-2013.03/bin/"
>    BUILD_ID="`date +build-%F_%H-%M-%S`"
>    SCRIPTS_ROOT="$PWD"
>    BUILD_ROOT="/home/jenkins/tisdk-build"
>    TEST_ROOT="$BUILD_ROOT/testing"
>    PACKAGE_ROOT="$BUILD_ROOT/packaging"
>    DEPLOY_ROOT="$BUILD_ROOT/deploy/$TISDK_VERSION"
>    FS_FILTER="tisdk-rootfs-"
>    FS_IMAGE_TYPE="tar.gz"
>    SDK_FILTER="arago-core-tisdk-image-"
>    SDK_IMAGE_TYPE="tar.gz"
>    NFS_ROOT="/home/jenkins/nfs-root"
>    SOURCE_DIR="${BUILD_ROOT}/sources"
>    CLEAN_BUILD="false"
>    CLEAN_ALL="false"
>    CONFIG_FILE="${BUILD_ROOT}/configs/arago-daisy-config.txt"
>    LOG_DIR="${BUILD_ROOT}/log-files"
>    BUILD_LOG_VERBOSE="true"
>    DL_DIR="/OE/downloads"
>    BB_GENERATE_MIRROR_TARBALLS="0"
>    INSTALLER_EXTRAS_ROOT="/home/jenkins/extra-files/installer_content"
>    TEST_SCRIPTS="$SCRIPTS_ROOT/test-scripts"
>    TEST_SCRIPTS_TGT="home/root/test-scripts"
>    TEST_LOCAL_IFACE="eth1"
>    OPENTEST_CLI="$SCRIPTS_ROOT/linux-devtest.tgz"
>    OPENTEST_TEE_IP="none"
>    OPENTEST_HW_CAP="linux_tigt_farm"
>    OPENTEST_BOOTLOADERS="false"
>    OPENTEST_BOOT_ATTEMPTS="3"
>    OPENTEST_BOOT_TIMEOUT="300"
>    RUN_BUILD_TESTS="true"
>    STAF_ROOT="/usr/local/staf"
>    SKIP_TEST_FAILURES="false"
>    PRODUCTIZE_SDK="false"
>    BITBAKE_COMMAND="arago-core-tisdk-image"
>    RESULTS_CONFIG_COMMENTS="false"
>    INSTALL_BUILDER="/home/jenkins/installbuilder"
>    INSTALLER_ROOT="$BUILD_ROOT/installer"
>    INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
>    INSTALLER_PREFIX="ti-sdk"
>    SD_CARD_CONTENT="/home/jenkins/extra-files/sd_content"
>    PACKAGE_BOOT_KERNEL_FILES="false"
>    WEBGEN_ROOT="/home/jenkins/webgen"
>    WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
>    WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
>    EXPORT_ARAGO_SRC="0"
>    COPY_TO_WEB="true"
>    COPY_DEPLOY_TO_WEB="true"
>    COPY_GOLDEN_TO_WEB="true"
>    WEB_HOST="lcpdbld@lsblogin01.dal.design.ti.com:/web/lcpd/htdocs/core-sdk/nightly"
>    CLEAN_AFTER_COPY="true"
>    BACKUP_RESULTS="/home/jenkins/jobs/arago-core-tisdk-nightly/workspace"

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


