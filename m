Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4E47A52A47
	for <meta-arago@arago-project.org>;
	Fri,  3 May 2013 02:22:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r432MJdC027114
	for <meta-arago@arago-project.org>; Thu, 2 May 2013 21:22:19 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r432MJja025750
	for <meta-arago@arago-project.org>; Thu, 2 May 2013 21:22:19 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 2 May 2013 21:22:19 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r432MJh4024745	for
	<meta-arago@arago-project.org>; Thu, 2 May 2013 21:22:19 -0500
Date: Thu, 2 May 2013 22:22:18 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20130503022218.GA9213@edge>
References: <2022571993.87.1367546016882.JavaMail.jenkins@puget>
MIME-Version: 1.0
In-Reply-To: <2022571993.87.1367546016882.JavaMail.jenkins@puget>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [nightly] Core TISDK 2013.05 build 2013-05-02_18-23-20
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
X-List-Received-Date: Fri, 03 May 2013 02:22:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

FYI, this is the first nightly build with Linaro gcc-4.7 hardfp toolchain!

I'll check the 2 failed platforms tomorrow...


On Thu, May 02, 2013 at 09:53:36PM -0400, Denys Dmytriyenko wrote:
> Status for 05/02/13
> 
> BUILD_ID: build-2013-05-02_18-24-20
> 
> Clean Build: true
> 
> Clean Sources: false
> 
> Repository Revisions
> 
> +----------------------------------------------------------------------------------------------------------------------------+
> |   Repository    |                     Git URL                     |Branch|Commit|                  Layers                  |
> |                 |                                                 |      |  ID  |                                          |
> |-----------------+-------------------------------------------------+------+------+------------------------------------------|
> |bitbake          |git://git.openembedded.org/bitbake               |master|1.17.0|layers=                                   |
> |-----------------+-------------------------------------------------+------+------+------------------------------------------|
> |meta-arago       |git://arago-project.org/git/meta-arago.git       |master|HEAD  |layers=meta-arago-distro:meta-arago-extras|
> |-----------------+-------------------------------------------------+------+------+------------------------------------------|
> |meta-openembedded|git://git.openembedded.org/meta-openembedded     |danny |HEAD  |layers=toolchain-layer:meta-oe            |
> |-----------------+-------------------------------------------------+------+------+------------------------------------------|
> |meta-ti          |git://arago-project.org/git/meta-ti.git          |danny |HEAD  |layers=                                   |
> |-----------------+-------------------------------------------------+------+------+------------------------------------------|
> |meta-linaro      |git://git.linaro.org/openembedded/meta-linaro.git|danny |HEAD  |layers=                                   |
> |-----------------+-------------------------------------------------+------+------+------------------------------------------|
> |oe-core          |git://git.openembedded.org/openembedded-core     |danny |HEAD  |layers=meta                               |
> +----------------------------------------------------------------------------------------------------------------------------+
> 
> Build and Target Test Results
> 
>    +-------------------------------------------+
>    |  Machine  |Build Result|Target Test Result|
>    |-----------+------------+------------------|
>    |am335x-evm |PASSED      |FAILED            |
>    |-----------+------------+------------------|
>    |am37x-evm  |FAILED      |SKIPPED           |
>    |-----------+------------+------------------|
>    |omap5-evm  |PASSED      |SKIPPED           |
>    |-----------+------------+------------------|
>    |beagleboard|PASSED      |FAILED            |
>    |-----------+------------+------------------|
>    |am3517-evm |FAILED      |SKIPPED           |
>    +-------------------------------------------+
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
>    TISDK_VERSION="2013.05"
>    MACHINES="am335x-evm am37x-evm omap5-evm beagleboard am3517-evm"
>    NUM_ARM9_BUILDS="1"
>    NUM_CORTEX_BUILDS="1"
>    TOOLCHAIN_ROOT_ARM9="/bin/"
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
>    CLEAN_BUILD="true"
>    CLEAN_ALL="false"
>    CONFIG_FILE="${BUILD_ROOT}/configs/arago-danny-config.txt"
>    LOG_DIR="${BUILD_ROOT}/log-files"
>    DL_DIR="/OE/downloads"
>    INSTALLER_EXTRAS_ROOT="/home/jenkins/extra-files/installer_content"
>    TEST_SCRIPTS="$SCRIPTS_ROOT/test-scripts"
>    TEST_SCRIPTS_TGT="home/root/test-scripts"
>    TEST_LOCAL_IFACE="eth1"
>    OPENTEST_CLI="$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz"
>    OPENTEST_TEE_IP="10.218.102.142"
>    RUN_BUILD_TESTS="true"
>    STAF_ROOT="/usr/local/staf"
>    SKIP_TEST_FAILURES="false"
>    PRODUCTIZE_SDK="false"
>    BITBAKE_COMMAND="arago-core-tisdk-image"
>    RESULTS_CONFIG_COMMENTS="false"
>    INSTALL_JAMMER="/home/jenkins/installjammer"
>    INSTALLER_ROOT="$BUILD_ROOT/installer"
>    MPI_FILE="$SCRIPTS_ROOT/mpi-files/ti-sdk-base.mpi"
>    SD_CARD_CONTENT="/home/jenkins/extra-files/sd_content"
>    WEBGEN_ROOT="/home/jenkins/webgen"
>    WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
>    WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data"
>    COPY_TO_WEB="true"
>    WEB_HOST=""
>    CLEAN_AFTER_COPY="true"
>    BACKUP_RESULTS="/home/jenkins/jobs/arago-core-tisdk-nightly/workspace"

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


