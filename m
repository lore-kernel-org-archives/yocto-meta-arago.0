Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 4BA1852A0A
	for <meta-arago@arago-project.org>;
	Sat,  8 Mar 2014 08:04:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s28844ZV027817
	for <meta-arago@arago-project.org>; Sat, 8 Mar 2014 02:04:04 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s28844wq015602
	for <meta-arago@arago-project.org>; Sat, 8 Mar 2014 02:04:04 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 8 Mar 2014 02:04:04 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s28844om006188	for <meta-arago@arago-project.org>;
	Sat, 8 Mar 2014 02:04:04 -0600
Date: Sat, 8 Mar 2014 02:50:10 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <1382831331.381.1394265010182.JavaMail.jenkins@puget>
MIME-Version: 1.0
X-Jenkins-Job: arago-core-tisdk-nightly
X-Jenkins-Result: SUCCESS
Subject: [nightly] Core TISDK 2013.12 build 2014-03-08_01-00-24
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
X-List-Received-Date: Sat, 08 Mar 2014 08:04:07 -0000
Content-Type: multipart/mixed;
	boundary="----=_Part_380_1411464699.1394265010144"

------=_Part_380_1411464699.1394265010144
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
<head>
<title>
Status for 03/08/14
</title>
</head>
<body>

<h2>Status for 03/08/14</h2>

<h2>BUILD_ID: build-2014-03-08_01-01-25</h2>

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
        <td>bbb4fa427739912ff3b87379bf629066f6662458</td>
        <td>layers=</td>
    </tr>
    <tr>
        <td>meta-arago</td>
        <td>git://arago-project.org/git/meta-arago.git</td>
        <td>dylan</td>
        <td>HEAD</td>
        <td>layers=meta-arago-distro:meta-arago-extras</td>
    </tr>
    <tr>
        <td>meta-qt5</td>
        <td>git://github.com/meta-qt5/meta-qt5.git</td>
        <td>master</td>
        <td>HEAD</td>
        <td>layers=</td>
    </tr>
    <tr>
        <td>meta-openembedded</td>
        <td>git://git.openembedded.org/meta-openembedded</td>
        <td>dylan</td>
        <td>HEAD</td>
        <td>layers=toolchain-layer:meta-networking:meta-ruby:meta-oe</td>
    </tr>
    <tr>
        <td>meta-ti</td>
        <td>git://arago-project.org/git/meta-ti.git</td>
        <td>dylan</td>
        <td>HEAD</td>
        <td>layers=</td>
    </tr>
    <tr>
        <td>meta-linaro</td>
        <td>git://git.linaro.org/openembedded/meta-linaro.git</td>
        <td>dylan</td>
        <td>HEAD</td>
        <td>layers=meta-linaro-toolchain</td>
    </tr>
    <tr>
        <td>oe-core</td>
        <td>git://git.openembedded.org/openembedded-core</td>
        <td>dylan</td>
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
        <td id="am335x-evm-build-result" bgcolor=lime>PASSED</td>
        <td id="am335x-evm-target-result" bgcolor=red>FAILED</td>
    </tr>
    <tr>
        <td>am437x-evm</td>
        <td id="am437x-evm-build-result" bgcolor=lime>PASSED</td>
        <td id="am437x-evm-target-result" bgcolor=red>FAILED</td>
    </tr>
    <tr>
        <td>am37x-evm</td>
        <td id="am37x-evm-build-result" bgcolor=lime>PASSED</td>
        <td id="am37x-evm-target-result" bgcolor=red>FAILED</td>
    </tr>
    <tr>
        <td>am3517-evm</td>
        <td id="am3517-evm-build-result" bgcolor=lime>PASSED</td>
        <td id="am3517-evm-target-result" bgcolor=red>FAILED</td>
    </tr>
    <tr>
        <td>omap5-evm</td>
        <td id="omap5-evm-build-result" bgcolor=lime>PASSED</td>
        <td id="omap5-evm-target-result" bgcolor=red>FAILED</td>
    </tr>
    <tr>
        <td>dra7xx-evm</td>
        <td id="dra7xx-evm-build-result" bgcolor=lime>PASSED</td>
        <td id="dra7xx-evm-target-result" bgcolor=red>FAILED</td>
    </tr>
    <tr>
        <td>beagleboard</td>
        <td id="beagleboard-build-result" bgcolor=lime>PASSED</td>
        <td id="beagleboard-target-result" bgcolor=red>FAILED</td>
    </tr>
    <tr>
        <td>am180x-evm</td>
        <td id="am180x-evm-build-result" bgcolor=lime>PASSED</td>
        <td id="am180x-evm-target-result" bgcolor=red>FAILED</td>
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
TISDK_VERSION="2013.12"<br>
MACHINES="am335x-evm am437x-evm am37x-evm am3517-evm omap5-evm dra7xx-evm beagleboard am180x-evm"<br>
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
CONFIG_FILE="${BUILD_ROOT}/configs/arago-dylan-config.txt"<br>
LOG_DIR="${BUILD_ROOT}/log-files"<br>
DL_DIR="/OE/downloads"<br>
INSTALLER_EXTRAS_ROOT="/home/jenkins/extra-files/installer_content"<br>
TEST_SCRIPTS="$SCRIPTS_ROOT/test-scripts"<br>
TEST_SCRIPTS_TGT="home/root/test-scripts"<br>
TEST_LOCAL_IFACE="eth1"<br>
OPENTEST_CLI="$SCRIPTS_ROOT/linux-devtest.tgz"<br>
OPENTEST_TEE_IP="none"<br>
OPENTEST_HW_CAP="linux_tigt_farm"<br>
RUN_BUILD_TESTS="true"<br>
STAF_ROOT="/usr/local/staf"<br>
SKIP_TEST_FAILURES="false"<br>
PRODUCTIZE_SDK="false"<br>
BITBAKE_COMMAND="arago-core-tisdk-image"<br>
RESULTS_CONFIG_COMMENTS="false"<br>
INSTALL_BUILDER="/home/jenkins/installbuilder"<br>
INSTALLER_ROOT="$BUILD_ROOT/installer"<br>
INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"<br>
SD_CARD_CONTENT="/home/jenkins/extra-files/sd_content"<br>
PACKAGE_BOOT_KERNEL_FILES="false"<br>
WEBGEN_ROOT="/home/jenkins/webgen"<br>
WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"<br>
WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data"<br>
COPY_TO_WEB="true"<br>
COPY_DEPLOY_TO_WEB="true"<br>
WEB_HOST="lcpdbld@lsblogin02.dal.design.ti.com:/web/lcpd/htdocs/core-sdk/nightly"<br>
CLEAN_AFTER_COPY="true"<br>
BACKUP_RESULTS="/home/jenkins/jobs/arago-core-tisdk-nightly/workspace"<br>
</p>

</body>
</html>


------=_Part_380_1411464699.1394265010144--
