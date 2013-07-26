Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id EC052529EA
	for <meta-arago@arago-project.org>;
	Fri, 26 Jul 2013 06:02:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6Q629ii026247
	for <meta-arago@arago-project.org>; Fri, 26 Jul 2013 01:02:09 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6Q629hC019909
	for <meta-arago@arago-project.org>; Fri, 26 Jul 2013 01:02:09 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 26 Jul 2013 01:02:09 -0500
Received: from puget.gt.design.ti.com ([158.218.102.159])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6Q628xX006161	for
	<meta-arago@arago-project.org>; Fri, 26 Jul 2013 01:02:09 -0500
Date: Fri, 26 Jul 2013 01:54:06 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <1887246878.427.1374818046587.JavaMail.jenkins@puget>
MIME-Version: 1.0
X-Jenkins-Job: arago-core-tisdk-nightly
X-Jenkins-Result: SUCCESS
Subject: [nightly] Core TISDK 2013.06 build 2013-07-26_01-01-44
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
X-List-Received-Date: Fri, 26 Jul 2013 06:02:13 -0000
Content-Type: multipart/mixed;
	boundary="----=_Part_426_1839151507.1374818046585"

------=_Part_426_1839151507.1374818046585
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
<head>
<title>
Status for 07/26/13
</title>
</head>
<body>

<h2>Status for 07/26/13</h2>

<h2>BUILD_ID: build-2013-07-26_01-02-45</h2>

<h2>Clean Build: false</h2>

<h2>Clean Sources: false</h2>
<h2><u>Repository Revisions</u></h2>
<table border=1 cellspacing=1 cellpadding=1>
    <tr>
        <th>Repository</th>
        <th>Git URL</th>
        <th>Branch</th>
        <th>Commit ID</th>
        <th>Layers</th>
    </tr>

    <tr>
        <td>bitbake</td>
        <td>git://git.openembedded.org/bitbake</td>
        <td>master</td>
        <td>1.17.0</td>
        <td>layers=</td>
    </tr>
    <tr>
        <td>meta-arago</td>
        <td>git://arago-project.org/git/meta-arago.git</td>
        <td>danny</td>
        <td>HEAD</td>
        <td>layers=meta-arago-distro:meta-arago-extras</td>
    </tr>
    <tr>
        <td>meta-openembedded</td>
        <td>git://git.openembedded.org/meta-openembedded</td>
        <td>danny</td>
        <td>HEAD</td>
        <td>layers=toolchain-layer:meta-oe</td>
    </tr>
    <tr>
        <td>meta-ti</td>
        <td>git://arago-project.org/git/meta-ti.git</td>
        <td>danny</td>
        <td>HEAD</td>
        <td>layers=</td>
    </tr>
    <tr>
        <td>meta-linaro</td>
        <td>git://git.linaro.org/openembedded/meta-linaro.git</td>
        <td>danny</td>
        <td>HEAD</td>
        <td>layers=</td>
    </tr>
    <tr>
        <td>oe-core</td>
        <td>git://git.openembedded.org/openembedded-core</td>
        <td>danny</td>
        <td>HEAD</td>
        <td>layers=meta</td>
    </tr>
</table>
<h2><u>Build and Target Test Results</u></h2>
<table border=1 cellspacing=1 cellpadding=1>
    <tr>
        <th>Machine</th>
        <th>Build Result</th>
        <th>Target Test Result</th>
    </tr>
    <tr>
        <td>am335x-evm</td>
        <td bgcolor=lime>PASSED</td>
        <td bgcolor=red>FAILED</td>
    </tr>
    <tr>
        <td>am37x-evm</td>
        <td bgcolor=lime>PASSED</td>
        <td bgcolor=lime>PASSED</td>
    </tr>
    <tr>
        <td>omap5-evm</td>
        <td bgcolor=red>FAILED</td>
        <td bgcolor=yellow>SKIPPED</td>
    </tr>
    <tr>
        <td>dra7xx-evm</td>
        <td bgcolor=red>FAILED</td>
        <td bgcolor=yellow>SKIPPED</td>
    </tr>
    <tr>
        <td>beagleboard</td>
        <td bgcolor=lime>PASSED</td>
        <td bgcolor=lime>PASSED</td>
    </tr>
    <tr>
        <td>am3517-evm</td>
        <td bgcolor=lime>PASSED</td>
        <td bgcolor=lime>PASSED</td>
    </tr>
    <tr>
        <td>am180x-evm</td>
        <td bgcolor=lime>PASSED</td>
        <td bgcolor=lime>PASSED</td>
    </tr>
</table>

<p>
These builds were performed using the build-oesdk.sh script at:
</p>
<p>
git://arago-project.org/git/projects/tisdk-build-scripts.git
</p>

<p>
The configuration file passed to this script had the contents:
</p>
<p>
MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"<br>
TISDK_VERSION="2013.06"<br>
MACHINES="am335x-evm am37x-evm omap5-evm dra7xx-evm beagleboard am3517-evm am180x-evm"<br>
NUM_ARM9_BUILDS="1"<br>
NUM_CORTEX_BUILDS="1"<br>
TOOLCHAIN_ROOT_ARM9="/opt/arago-2011.09/armv5te/bin/"<br>
TOOLCHAIN_ROOT_CORTEX="/opt/linaro-2013.03/bin/"<br>
BUILD_ID="`date +build-%F_%H-%M-%S`"<br>
SCRIPTS_ROOT="$PWD"<br>
BUILD_ROOT="/home/jenkins/tisdk-build"<br>
TEST_ROOT="$BUILD_ROOT/testing"<br>
PACKAGE_ROOT="$BUILD_ROOT/packaging"<br>
DEPLOY_ROOT="$BUILD_ROOT/deploy/$TISDK_VERSION"<br>
FS_FILTER="tisdk-rootfs-"<br>
FS_IMAGE_TYPE="tar.gz"<br>
SDK_FILTER="arago-core-tisdk-image-"<br>
SDK_IMAGE_TYPE="tar.gz"<br>
NFS_ROOT="/home/jenkins/nfs-root"<br>
SOURCE_DIR="${BUILD_ROOT}/sources"<br>
CLEAN_BUILD="false"<br>
CLEAN_ALL="false"<br>
CONFIG_FILE="${BUILD_ROOT}/configs/arago-danny-config.txt"<br>
LOG_DIR="${BUILD_ROOT}/log-files"<br>
DL_DIR="/OE/downloads"<br>
INSTALLER_EXTRAS_ROOT="/home/jenkins/extra-files/installer_content"<br>
TEST_SCRIPTS="$SCRIPTS_ROOT/test-scripts"<br>
TEST_SCRIPTS_TGT="home/root/test-scripts"<br>
TEST_LOCAL_IFACE="eth1"<br>
OPENTEST_CLI="$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz"<br>
OPENTEST_TEE_IP="10.218.102.142"<br>
RUN_BUILD_TESTS="true"<br>
STAF_ROOT="/usr/local/staf"<br>
SKIP_TEST_FAILURES="false"<br>
PRODUCTIZE_SDK="false"<br>
BITBAKE_COMMAND="arago-core-tisdk-image"<br>
RESULTS_CONFIG_COMMENTS="false"<br>
INSTALL_JAMMER="/home/jenkins/installjammer"<br>
INSTALLER_ROOT="$BUILD_ROOT/installer"<br>
MPI_FILE="$SCRIPTS_ROOT/mpi-files/ti-sdk-base.mpi"<br>
SD_CARD_CONTENT="/home/jenkins/extra-files/sd_content"<br>
PACKAGE_BOOT_UIMAGE="false"<br>
WEBGEN_ROOT="/home/jenkins/webgen"<br>
WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"<br>
WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data"<br>
COPY_TO_WEB="true"<br>
WEB_HOST=""<br>
CLEAN_AFTER_COPY="true"<br>
BACKUP_RESULTS="/home/jenkins/jobs/arago-core-tisdk-nightly/workspace"<br>
</p>

</body>
</html>


------=_Part_426_1839151507.1374818046585--
