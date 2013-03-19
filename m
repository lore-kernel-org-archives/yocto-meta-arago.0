Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id ABD3452A19
	for <meta-arago@arago-project.org>;
	Tue, 19 Mar 2013 17:51:30 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2JHpTgK006748
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 12:51:29 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JHpTk6030908
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 12:51:29 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 19 Mar 2013 12:51:29 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r2JHpTXi017329	for
	<meta-arago@arago-project.org>; Tue, 19 Mar 2013 12:51:29 -0500
Date: Tue, 19 Mar 2013 13:51:28 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20130319175128.GR32759@edge>
References: <1186596819.57.1363666176762.JavaMail.jenkins@puget>
MIME-Version: 1.0
In-Reply-To: <1186596819.57.1363666176762.JavaMail.jenkins@puget>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [nightly] Core TISDK 2013.03 build 2013-03-18_23-01-06
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
X-List-Received-Date: Tue, 19 Mar 2013 17:51:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ok, the build results are now much better!

The only broken build is for the beagleboard with the latest Graphics SDK and 
I believe Franklin already has a fix for that - I'll wait for a patch.

And as of the run-time tests - I'm still tweaking some things and updating 
configuration... The console logs show that 3 out of 4 tested boards actually 
were able to boot, but there were some testing hick-ups. I am also switching 
to a different board farm, that is geographically closer to me (i.e. local), 
so should have slightly better control over this aspect.

Stay tuned!

-- 
Denys


On Tue, Mar 19, 2013 at 12:09:36AM -0400, Denys Dmytriyenko wrote:
> Status for 03/19/13
> 
> BUILD_ID: build-2013-03-18_23-02-13
> 
> Clean Build: false
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
>    |am37x-evm  |PASSED      |FAILED            |
>    |-----------+------------+------------------|
>    |beagleboard|FAILED      |SKIPPED           |
>    |-----------+------------+------------------|
>    |am3517-evm |PASSED      |FAILED            |
>    |-----------+------------+------------------|
>    |am180x-evm |PASSED      |FAILED            |
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
>    TISDK_VERSION="2013.03"
>    MACHINES="am335x-evm am37x-evm beagleboard am3517-evm am180x-evm"
>    NUM_ARM9_BUILDS="1"
>    NUM_CORTEX_BUILDS="1"
>    TOOLCHAIN_ROOT_ARM9="/opt/arago-2011.09/armv5te/bin/"
>    TOOLCHAIN_ROOT_CORTEX="/opt/arago-2011.09/armv7a/bin/"
>    BUILD_ID="`date +build-%F_%H-%M-%S`"
>    SCRIPTS_ROOT="$PWD"
>    BUILD_ROOT="/home/jenkins/tisdk-build"
>    TEST_ROOT="$BUILD_ROOT/testing"
>    PACKAGE_ROOT="$BUILD_ROOT/packaging"
>    DEPLOY_ROOT="$BUILD_ROOT/deploy/$TISDK_VERSION"
>    FS_FILTER="tisdk-rootfs-"
>    FS_IMAGE_TYPE="tar.gz"
>    SDK_FILTER="arago-amsdk-image-"
>    SDK_IMAGE_TYPE="tar.gz"
>    NFS_ROOT="/home/jenkins/nfs-root"
>    SOURCE_DIR="${BUILD_ROOT}/sources"
>    CLEAN_BUILD="false"
>    CLEAN_ALL="false"
>    CONFIG_FILE="${BUILD_ROOT}/configs/arago-danny-config.txt"
>    LOG_DIR="${BUILD_ROOT}/log-files"
>    DL_DIR="/OE/downloads"
>    INSTALLER_EXTRAS_ROOT="/home/jenkins/extra-files/installer_content"
>    TEST_SCRIPTS="$SCRIPTS_ROOT/test-scripts"
>    TEST_SCRIPTS_TGT="home/root/test-scripts"
>    TEST_LOCAL_IFACE="eth1"
>    OPENTEST_CLI="$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz"
>    RUN_BUILD_TESTS="true"
>    STAF_ROOT="/usr/local/staf"
>    SKIP_TEST_FAILURES="false"
>    PRODUCTIZE_SDK="false"
>    BITBAKE_COMMAND="arago-amsdk-image"
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


