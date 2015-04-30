Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 06E1C529BA
	for <meta-arago@arago-project.org>;
	Thu, 30 Apr 2015 15:39:35 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3UFdZoO009450
	for <meta-arago@arago-project.org>; Thu, 30 Apr 2015 10:39:35 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3UFdYlM009027
	for <meta-arago@arago-project.org>; Thu, 30 Apr 2015 10:39:34 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Thu, 30 Apr 2015 10:39:33 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [nightly] Core TISDK 2015.04 build
	2015-04-29_21-30-23
Thread-Index: AQHQg1ohcSxGbYTyo0Sxbel4wOEIsJ1lr90k
Date: Thu, 30 Apr 2015 15:39:33 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE7322402D8@DLEE08.ent.ti.com>
References: <342967599.297.1430407609376.JavaMail.jenkins@puget>
In-Reply-To: <342967599.297.1430407609376.JavaMail.jenkins@puget>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [nightly] Core TISDK 2015.04 build 2015-04-29_21-30-23
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
X-List-Received-Date: Thu, 30 Apr 2015 15:39:36 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE7322402D8DLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE7322402D8DLEE08entticom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

All,

Ok, finally got it all built successfully!
Had to switch back to bitbake 1.24, since 1.26 has a nasty md5 checksum cor=
ruption issue (need to research that one some more). And had to do a clean =
build completely from scratch due to some packages being corrupted from 1.2=
6...

As of runtime tests - there's no am57xx-evm in the board farm for now and K=
eystones are not yet setup.

--
Denys


________________________________
From: meta-arago-bounces@arago-project.org [meta-arago-bounces@arago-projec=
t.org] on behalf of Dmytriyenko, Denys
Sent: Thursday, April 30, 2015 11:26 AM
To: meta-arago@arago-project.org
Subject: [meta-arago] [nightly] Core TISDK 2015.04 build 2015-04-29_21-30-2=
3

Status for 04/30/15
BUILD_ID: build-2015-04-29_21-31-34
Clean Build: true
Clean Sources: false
Repository Revisions
Repository      Git URL Branch  Commit ID       Layers
bitbake git://git.openembedded.org/bitbake      1.24    HEAD    layers=3D
meta-arago      git://arago-project.org/git/meta-arago.git      master  HEA=
D    layers=3Dmeta-arago-distro:meta-arago-extras
meta-qt5        git://github.com/meta-qt5/meta-qt5.git  master  HEAD    lay=
ers=3D
meta-openembedded       git://git.openembedded.org/meta-openembedded    dai=
sy   HEAD    layers=3Dtoolchain-layer:meta-networking:meta-ruby:meta-oe
meta-ti git://arago-project.org/git/meta-ti.git daisy   HEAD    layers=3D
meta-linaro     git://git.linaro.org/openembedded/meta-linaro.git       dai=
sy   HEAD    layers=3Dmeta-linaro-toolchain
oe-core git://git.openembedded.org/openembedded-core    daisy   HEAD    lay=
ers=3Dmeta
Build and Target Test Results
Machine Build Result    Target Test Result
am335x-evm      PASSED  PASSED
am437x-evm      PASSED  PASSED
dra7xx-evm      PASSED  PASSED
am57xx-evm      PASSED  FAILED
omap5-evm       PASSED  PASSED
k2hk-evm        PASSED  FAILED: CRITICAL
k2e-evm PASSED  FAILED: CRITICAL
k2l-evm PASSED  FAILED: CRITICAL

These builds were performed using the build-oesdk.sh script at:

git://arago-project.org/git/projects/tisdk-build-scripts.git

The configuration file passed to this script had the contents:

MANDATORY_INPUTS=3D"MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCR=
IPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTE=
R FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
TISDK_VERSION=3D"2015.04"
MACHINES=3D"am335x-evm am437x-evm dra7xx-evm am57xx-evm omap5-evm k2hk-evm =
k2e-evm k2l-evm"
NUM_ARM9_BUILDS=3D"1"
NUM_CORTEX_BUILDS=3D"1"
TOOLCHAIN_ROOT_ARM9=3D"/opt/arago-2011.09/armv5te/bin/"
TOOLCHAIN_ROOT_CORTEX=3D"/opt/linaro-2013.03/bin/"
BUILD_ID=3D"`date +build-%F_%H-%M-%S`"
SCRIPTS_ROOT=3D"$PWD"
BUILD_ROOT=3D"/home/jenkins/tisdk-build"
TEST_ROOT=3D"$BUILD_ROOT/testing"
PACKAGE_ROOT=3D"$BUILD_ROOT/packaging"
DEPLOY_ROOT=3D"$BUILD_ROOT/deploy/$TISDK_VERSION"
FS_FILTER=3D"tisdk-rootfs-"
FS_IMAGE_TYPE=3D"tar.gz"
SDK_FILTER=3D"arago-core-tisdk-image-"
SDK_IMAGE_TYPE=3D"tar.gz"
NFS_ROOT=3D"/home/jenkins/nfs-root"
SOURCE_DIR=3D"${BUILD_ROOT}/sources"
CLEAN_BUILD=3D"true"
CLEAN_ALL=3D"false"
CONFIG_FILE=3D"${BUILD_ROOT}/configs/arago-daisy-config.txt"
LOG_DIR=3D"${BUILD_ROOT}/log-files"
BUILD_LOG_VERBOSE=3D"true"
DL_DIR=3D"/OE/downloads"
BB_GENERATE_MIRROR_TARBALLS=3D"0"
INSTALLER_EXTRAS_ROOT=3D"/home/jenkins/extra-files/installer_content"
TEST_SCRIPTS=3D"$SCRIPTS_ROOT/test-scripts"
TEST_SCRIPTS_TGT=3D"home/root/test-scripts"
TEST_LOCAL_IFACE=3D"eth1"
OPENTEST_CLI=3D"$SCRIPTS_ROOT/linux-devtest.tgz"
OPENTEST_TEE_IP=3D"none"
OPENTEST_HW_CAP=3D"linux_tigt_farm"
OPENTEST_BOOTLOADERS=3D"false"
OPENTEST_BOOT_ATTEMPTS=3D"3"
OPENTEST_BOOT_TIMEOUT=3D"300"
RUN_BUILD_TESTS=3D"true"
STAF_ROOT=3D"/usr/local/staf"
SKIP_TEST_FAILURES=3D"false"
PRODUCTIZE_SDK=3D"false"
BITBAKE_COMMAND=3D"arago-core-tisdk-image"
RESULTS_CONFIG_COMMENTS=3D"false"
INSTALL_BUILDER=3D"/home/jenkins/installbuilder"
INSTALLER_ROOT=3D"$BUILD_ROOT/installer"
INSTALL_BUILDER_PROJECT=3D"$SCRIPTS_ROOT/installer-files/tisdk.xml"
INSTALLER_PREFIX=3D"ti-sdk"
SD_CARD_CONTENT=3D"/home/jenkins/extra-files/sd_content"
PACKAGE_BOOT_KERNEL_FILES=3D"false"
WEBGEN_ROOT=3D"/home/jenkins/webgen"
WEB_EXTRAS_ROOT=3D"/home/jenkins/extra-files/web_content"
WEBGEN_MAK_ROOT=3D"$SCRIPTS_ROOT/publish-sdk-data/coresdk"
EXPORT_ARAGO_SRC=3D"0"
COPY_TO_WEB=3D"true"
COPY_DEPLOY_TO_WEB=3D"true"
COPY_GOLDEN_TO_WEB=3D"true"
WEB_HOST=3D"lcpdbld@lsblogin01.dal.design.ti.com:/web/lcpd/htdocs/core-sdk/=
nightly"
CLEAN_AFTER_COPY=3D"true"
BACKUP_RESULTS=3D"/home/jenkins/jobs/arago-core-tisdk-nightly/workspace"

--_000_B0581B5571079145BA1CD78C126DBDE7322402D8DLEE08entticom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr" style=3D"background-image: none; background-position: 0% =
0%; background-repeat: repeat;">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" id=3D"owaParaStyle"></style>
</head>
<body fpstyle=3D"1" ocsi=3D"0">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">
<div>All,</div>
<div><br>
</div>
Ok, finally got it all built successfully!
<div>Had to switch back to bitbake 1.24, since 1.26 has a nasty md5 checksu=
m corruption issue (need to research that one some more). And had to do a c=
lean build completely from scratch due to some packages being corrupted fro=
m 1.26...</div>
<div><br>
</div>
<div>As of runtime tests - there's no am57xx-evm in the board farm for now =
and Keystones are not yet setup.</div>
<div><br>
</div>
<div>--&nbsp;</div>
<div>Denys</div>
<div><br>
</div>
<div><br>
<div style=3D"font-family: Times New Roman; color: #000000; font-size: 16px=
">
<hr tabindex=3D"-1">
<div id=3D"divRpF854826" style=3D"direction: ltr;"><font face=3D"Tahoma" si=
ze=3D"2" color=3D"#000000"><b>From:</b> meta-arago-bounces@arago-project.or=
g [meta-arago-bounces@arago-project.org] on behalf of Dmytriyenko, Denys<br=
>
<b>Sent:</b> Thursday, April 30, 2015 11:26 AM<br>
<b>To:</b> meta-arago@arago-project.org<br>
<b>Subject:</b> [meta-arago] [nightly] Core TISDK 2015.04 build 2015-04-29_=
21-30-23<br>
</font><br>
</div>
<div></div>
<div>
<h2>Status for 04/30/15</h2>
<h2>BUILD_ID: build-2015-04-29_21-31-34</h2>
<h2>Clean Build: true</h2>
<h2>Clean Sources: false</h2>
<h2><u>Repository Revisions</u></h2>
<table border=3D"1" cellspacing=3D"1" cellpadding=3D"1">
<tbody>
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
<td>1.24</td>
<td>HEAD</td>
<td>layers=3D</td>
</tr>
<tr>
<td>meta-arago</td>
<td>git://arago-project.org/git/meta-arago.git</td>
<td>master</td>
<td>HEAD</td>
<td>layers=3Dmeta-arago-distro:meta-arago-extras</td>
</tr>
<tr>
<td>meta-qt5</td>
<td>git://github.com/meta-qt5/meta-qt5.git</td>
<td>master</td>
<td>HEAD</td>
<td>layers=3D</td>
</tr>
<tr>
<td>meta-openembedded</td>
<td>git://git.openembedded.org/meta-openembedded</td>
<td>daisy</td>
<td>HEAD</td>
<td>layers=3Dtoolchain-layer:meta-networking:meta-ruby:meta-oe</td>
</tr>
<tr>
<td>meta-ti</td>
<td>git://arago-project.org/git/meta-ti.git</td>
<td>daisy</td>
<td>HEAD</td>
<td>layers=3D</td>
</tr>
<tr>
<td>meta-linaro</td>
<td>git://git.linaro.org/openembedded/meta-linaro.git</td>
<td>daisy</td>
<td>HEAD</td>
<td>layers=3Dmeta-linaro-toolchain</td>
</tr>
<tr>
<td>oe-core</td>
<td>git://git.openembedded.org/openembedded-core</td>
<td>daisy</td>
<td>HEAD</td>
<td>layers=3Dmeta</td>
</tr>
</tbody>
</table>
<h2><u>Build and Target Test Results</u></h2>
<table border=3D"1" cellspacing=3D"1" cellpadding=3D"1">
<tbody>
<tr>
<th>Machine</th>
<th>Build Result</th>
<th>Target Test Result</th>
</tr>
<tr>
<td>am335x-evm</td>
<td id=3D"am335x-evm-build-result" bgcolor=3D"lime">PASSED</td>
<td id=3D"am335x-evm-target-result" bgcolor=3D"lime">PASSED</td>
</tr>
<tr>
<td>am437x-evm</td>
<td id=3D"am437x-evm-build-result" bgcolor=3D"lime">PASSED</td>
<td id=3D"am437x-evm-target-result" bgcolor=3D"lime">PASSED</td>
</tr>
<tr>
<td>dra7xx-evm</td>
<td id=3D"dra7xx-evm-build-result" bgcolor=3D"lime">PASSED</td>
<td id=3D"dra7xx-evm-target-result" bgcolor=3D"lime">PASSED</td>
</tr>
<tr>
<td>am57xx-evm</td>
<td id=3D"am57xx-evm-build-result" bgcolor=3D"lime">PASSED</td>
<td id=3D"am57xx-evm-target-result" bgcolor=3D"red">FAILED</td>
</tr>
<tr>
<td>omap5-evm</td>
<td id=3D"omap5-evm-build-result" bgcolor=3D"lime">PASSED</td>
<td id=3D"omap5-evm-target-result" bgcolor=3D"lime">PASSED</td>
</tr>
<tr>
<td>k2hk-evm</td>
<td id=3D"k2hk-evm-build-result" bgcolor=3D"lime">PASSED</td>
<td id=3D"k2hk-evm-target-result" bgcolor=3D"red">FAILED: CRITICAL</td>
</tr>
<tr>
<td>k2e-evm</td>
<td id=3D"k2e-evm-build-result" bgcolor=3D"lime">PASSED</td>
<td id=3D"k2e-evm-target-result" bgcolor=3D"red">FAILED: CRITICAL</td>
</tr>
<tr>
<td>k2l-evm</td>
<td id=3D"k2l-evm-build-result" bgcolor=3D"lime">PASSED</td>
<td id=3D"k2l-evm-target-result" bgcolor=3D"red">FAILED: CRITICAL</td>
</tr>
</tbody>
</table>
<p>These builds were performed using the build-oesdk.sh script at: </p>
<p>git://arago-project.org/git/projects/tisdk-build-scripts.git </p>
<p>The configuration file passed to this script had the contents: </p>
<p>MANDATORY_INPUTS=3D&quot;MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUIL=
D_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER S=
DK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_V=
ERSION&quot;<br>
TISDK_VERSION=3D&quot;2015.04&quot;<br>
MACHINES=3D&quot;am335x-evm am437x-evm dra7xx-evm am57xx-evm omap5-evm k2hk=
-evm k2e-evm k2l-evm&quot;<br>
NUM_ARM9_BUILDS=3D&quot;1&quot;<br>
NUM_CORTEX_BUILDS=3D&quot;1&quot;<br>
TOOLCHAIN_ROOT_ARM9=3D&quot;/opt/arago-2011.09/armv5te/bin/&quot;<br>
TOOLCHAIN_ROOT_CORTEX=3D&quot;/opt/linaro-2013.03/bin/&quot;<br>
BUILD_ID=3D&quot;`date &#43;build-%F_%H-%M-%S`&quot;<br>
SCRIPTS_ROOT=3D&quot;$PWD&quot;<br>
BUILD_ROOT=3D&quot;/home/jenkins/tisdk-build&quot;<br>
TEST_ROOT=3D&quot;$BUILD_ROOT/testing&quot;<br>
PACKAGE_ROOT=3D&quot;$BUILD_ROOT/packaging&quot;<br>
DEPLOY_ROOT=3D&quot;$BUILD_ROOT/deploy/$TISDK_VERSION&quot;<br>
FS_FILTER=3D&quot;tisdk-rootfs-&quot;<br>
FS_IMAGE_TYPE=3D&quot;tar.gz&quot;<br>
SDK_FILTER=3D&quot;arago-core-tisdk-image-&quot;<br>
SDK_IMAGE_TYPE=3D&quot;tar.gz&quot;<br>
NFS_ROOT=3D&quot;/home/jenkins/nfs-root&quot;<br>
SOURCE_DIR=3D&quot;${BUILD_ROOT}/sources&quot;<br>
CLEAN_BUILD=3D&quot;true&quot;<br>
CLEAN_ALL=3D&quot;false&quot;<br>
CONFIG_FILE=3D&quot;${BUILD_ROOT}/configs/arago-daisy-config.txt&quot;<br>
LOG_DIR=3D&quot;${BUILD_ROOT}/log-files&quot;<br>
BUILD_LOG_VERBOSE=3D&quot;true&quot;<br>
DL_DIR=3D&quot;/OE/downloads&quot;<br>
BB_GENERATE_MIRROR_TARBALLS=3D&quot;0&quot;<br>
INSTALLER_EXTRAS_ROOT=3D&quot;/home/jenkins/extra-files/installer_content&q=
uot;<br>
TEST_SCRIPTS=3D&quot;$SCRIPTS_ROOT/test-scripts&quot;<br>
TEST_SCRIPTS_TGT=3D&quot;home/root/test-scripts&quot;<br>
TEST_LOCAL_IFACE=3D&quot;eth1&quot;<br>
OPENTEST_CLI=3D&quot;$SCRIPTS_ROOT/linux-devtest.tgz&quot;<br>
OPENTEST_TEE_IP=3D&quot;none&quot;<br>
OPENTEST_HW_CAP=3D&quot;linux_tigt_farm&quot;<br>
OPENTEST_BOOTLOADERS=3D&quot;false&quot;<br>
OPENTEST_BOOT_ATTEMPTS=3D&quot;3&quot;<br>
OPENTEST_BOOT_TIMEOUT=3D&quot;300&quot;<br>
RUN_BUILD_TESTS=3D&quot;true&quot;<br>
STAF_ROOT=3D&quot;/usr/local/staf&quot;<br>
SKIP_TEST_FAILURES=3D&quot;false&quot;<br>
PRODUCTIZE_SDK=3D&quot;false&quot;<br>
BITBAKE_COMMAND=3D&quot;arago-core-tisdk-image&quot;<br>
RESULTS_CONFIG_COMMENTS=3D&quot;false&quot;<br>
INSTALL_BUILDER=3D&quot;/home/jenkins/installbuilder&quot;<br>
INSTALLER_ROOT=3D&quot;$BUILD_ROOT/installer&quot;<br>
INSTALL_BUILDER_PROJECT=3D&quot;$SCRIPTS_ROOT/installer-files/tisdk.xml&quo=
t;<br>
INSTALLER_PREFIX=3D&quot;ti-sdk&quot;<br>
SD_CARD_CONTENT=3D&quot;/home/jenkins/extra-files/sd_content&quot;<br>
PACKAGE_BOOT_KERNEL_FILES=3D&quot;false&quot;<br>
WEBGEN_ROOT=3D&quot;/home/jenkins/webgen&quot;<br>
WEB_EXTRAS_ROOT=3D&quot;/home/jenkins/extra-files/web_content&quot;<br>
WEBGEN_MAK_ROOT=3D&quot;$SCRIPTS_ROOT/publish-sdk-data/coresdk&quot;<br>
EXPORT_ARAGO_SRC=3D&quot;0&quot;<br>
COPY_TO_WEB=3D&quot;true&quot;<br>
COPY_DEPLOY_TO_WEB=3D&quot;true&quot;<br>
COPY_GOLDEN_TO_WEB=3D&quot;true&quot;<br>
WEB_HOST=3D&quot;lcpdbld@lsblogin01.dal.design.ti.com:/web/lcpd/htdocs/core=
-sdk/nightly&quot;<br>
CLEAN_AFTER_COPY=3D&quot;true&quot;<br>
BACKUP_RESULTS=3D&quot;/home/jenkins/jobs/arago-core-tisdk-nightly/workspac=
e&quot;<br>
</p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE7322402D8DLEE08entticom_--
