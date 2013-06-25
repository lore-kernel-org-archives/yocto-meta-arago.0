Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A879A52992
	for <meta-arago@arago-project.org>;
	Tue, 25 Jun 2013 17:10:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5PHAJHh000309
	for <meta-arago@arago-project.org>; Tue, 25 Jun 2013 12:10:19 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5PHAJkK031253
	for <meta-arago@arago-project.org>; Tue, 25 Jun 2013 12:10:19 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 25 Jun 2013 12:10:19 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [nightly] Core TISDK 2013.06 build
	2013-06-25_11-19-59
Thread-Index: AQHOccRVFdLDlc5jxU+XAG0AmfvVgZlGqjQ9
Date: Tue, 25 Jun 2013 17:10:19 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE72E821DF5@DLEE08.ent.ti.com>
References: <1418035497.303.1372178685102.JavaMail.jenkins@puget>
In-Reply-To: <1418035497.303.1372178685102.JavaMail.jenkins@puget>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: [nightly] Core TISDK 2013.06 build 2013-06-25_11-19-59
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
X-List-Received-Date: Tue, 25 Jun 2013 17:10:21 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE72E821DF5DLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE72E821DF5DLEE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Looks much better now!

Dra7xx doesn't have a working network driver yet and boots off of SD, hence=
 our NFS based tests won't work.

I'm looking into am335 and omap5 test failures now...


Denys


-----Original Message-----
From: Dmytriyenko, Denys [denys@ti.com]
Received: Tuesday, 25 Jun 2013, 12:52
To: meta-arago@arago-project.org [meta-arago@arago-project.org]
Subject: [meta-arago] [nightly] Core TISDK 2013.06 build 2013-06-25_11-19-5=
9

Status for 06/25/13
BUILD_ID: build-2013-06-25_11-20-59
Clean Build: false
Clean Sources: false
Repository Revisions
Repository      Git URL Branch  Commit ID       Layers
bitbake git://git.openembedded.org/bitbake      master  1.17.0  layers=3D
meta-arago      git://arago-project.org/git/meta-arago.git      master  HEA=
D    layers=3Dmeta-arago-distro:meta-arago-extras
meta-openembedded       git://git.openembedded.org/meta-openembedded    dan=
ny   HEAD    layers=3Dtoolchain-layer:meta-oe
meta-ti git://arago-project.org/git/meta-ti.git danny   HEAD    layers=3D
meta-linaro     git://git.linaro.org/openembedded/meta-linaro.git       dan=
ny   HEAD    layers=3D
oe-core git://git.openembedded.org/openembedded-core    danny   HEAD    lay=
ers=3Dmeta
Build and Target Test Results
Machine Build Result    Target Test Result
am335x-evm      PASSED  FAILED
am37x-evm       PASSED  PASSED
omap5-evm       PASSED  FAILED
dra7xx-evm      PASSED  FAILED
beagleboard     PASSED  PASSED
am3517-evm      PASSED  PASSED
am180x-evm      PASSED  PASSED

These builds were performed using the build-oesdk.sh script at:

git://arago-project.org/git/projects/tisdk-build-scripts.git

The configuration file passed to this script had the contents:

MANDATORY_INPUTS=3D"MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCR=
IPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTE=
R FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
TISDK_VERSION=3D"2013.06"
MACHINES=3D"am335x-evm am37x-evm omap5-evm dra7xx-evm beagleboard am3517-ev=
m am180x-evm"
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
CLEAN_BUILD=3D"false"
CLEAN_ALL=3D"false"
CONFIG_FILE=3D"${BUILD_ROOT}/configs/arago-danny-config.txt"
LOG_DIR=3D"${BUILD_ROOT}/log-files"
DL_DIR=3D"/OE/downloads"
INSTALLER_EXTRAS_ROOT=3D"/home/jenkins/extra-files/installer_content"
TEST_SCRIPTS=3D"$SCRIPTS_ROOT/test-scripts"
TEST_SCRIPTS_TGT=3D"home/root/test-scripts"
TEST_LOCAL_IFACE=3D"eth1"
OPENTEST_CLI=3D"$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz"
OPENTEST_TEE_IP=3D"10.218.102.142"
RUN_BUILD_TESTS=3D"true"
STAF_ROOT=3D"/usr/local/staf"
SKIP_TEST_FAILURES=3D"false"
PRODUCTIZE_SDK=3D"false"
BITBAKE_COMMAND=3D"arago-core-tisdk-image"
RESULTS_CONFIG_COMMENTS=3D"false"
INSTALL_JAMMER=3D"/home/jenkins/installjammer"
INSTALLER_ROOT=3D"$BUILD_ROOT/installer"
MPI_FILE=3D"$SCRIPTS_ROOT/mpi-files/ti-sdk-base.mpi"
SD_CARD_CONTENT=3D"/home/jenkins/extra-files/sd_content"
PACKAGE_BOOT_UIMAGE=3D"false"
WEBGEN_ROOT=3D"/home/jenkins/webgen"
WEB_EXTRAS_ROOT=3D"/home/jenkins/extra-files/web_content"
WEBGEN_MAK_ROOT=3D"$SCRIPTS_ROOT/publish-sdk-data"
COPY_TO_WEB=3D"true"
WEB_HOST=3D""
CLEAN_AFTER_COPY=3D"true"
BACKUP_RESULTS=3D"/home/jenkins/jobs/arago-core-tisdk-nightly/workspace"

--_000_B0581B5571079145BA1CD78C126DBDE72E821DF5DLEE08entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">Looks much better now!<br>
<br>
Dra7xx doesn't have a working network driver yet and boots off of SD, hence=
 our NFS based tests won't work.<br>
<br>
I'm looking into am335 and omap5 test failures now...<br>
<br>
<br>
Denys<br>
<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Dmytriyenko, Denys [denys@ti.com]<br>
<b>Received:</b> Tuesday, 25 Jun 2013, 12:52<br>
<b>To:</b> meta-arago@arago-project.org [meta-arago@arago-project.org]<br>
<b>Subject:</b> [meta-arago] [nightly] Core TISDK 2013.06 build 2013-06-25_=
11-19-59<br>
<br>
</span></span>
<div>
<h2>Status for 06/25/13</h2>
<h2>BUILD_ID: build-2013-06-25_11-20-59</h2>
<h2>Clean Build: false</h2>
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
<td>master</td>
<td>1.17.0</td>
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
<td>meta-openembedded</td>
<td>git://git.openembedded.org/meta-openembedded</td>
<td>danny</td>
<td>HEAD</td>
<td>layers=3Dtoolchain-layer:meta-oe</td>
</tr>
<tr>
<td>meta-ti</td>
<td>git://arago-project.org/git/meta-ti.git</td>
<td>danny</td>
<td>HEAD</td>
<td>layers=3D</td>
</tr>
<tr>
<td>meta-linaro</td>
<td>git://git.linaro.org/openembedded/meta-linaro.git</td>
<td>danny</td>
<td>HEAD</td>
<td>layers=3D</td>
</tr>
<tr>
<td>oe-core</td>
<td>git://git.openembedded.org/openembedded-core</td>
<td>danny</td>
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
<td bgcolor=3D"lime">PASSED</td>
<td bgcolor=3D"red">FAILED</td>
</tr>
<tr>
<td>am37x-evm</td>
<td bgcolor=3D"lime">PASSED</td>
<td bgcolor=3D"lime">PASSED</td>
</tr>
<tr>
<td>omap5-evm</td>
<td bgcolor=3D"lime">PASSED</td>
<td bgcolor=3D"red">FAILED</td>
</tr>
<tr>
<td>dra7xx-evm</td>
<td bgcolor=3D"lime">PASSED</td>
<td bgcolor=3D"red">FAILED</td>
</tr>
<tr>
<td>beagleboard</td>
<td bgcolor=3D"lime">PASSED</td>
<td bgcolor=3D"lime">PASSED</td>
</tr>
<tr>
<td>am3517-evm</td>
<td bgcolor=3D"lime">PASSED</td>
<td bgcolor=3D"lime">PASSED</td>
</tr>
<tr>
<td>am180x-evm</td>
<td bgcolor=3D"lime">PASSED</td>
<td bgcolor=3D"lime">PASSED</td>
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
TISDK_VERSION=3D&quot;2013.06&quot;<br>
MACHINES=3D&quot;am335x-evm am37x-evm omap5-evm dra7xx-evm beagleboard am35=
17-evm am180x-evm&quot;<br>
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
CLEAN_BUILD=3D&quot;false&quot;<br>
CLEAN_ALL=3D&quot;false&quot;<br>
CONFIG_FILE=3D&quot;${BUILD_ROOT}/configs/arago-danny-config.txt&quot;<br>
LOG_DIR=3D&quot;${BUILD_ROOT}/log-files&quot;<br>
DL_DIR=3D&quot;/OE/downloads&quot;<br>
INSTALLER_EXTRAS_ROOT=3D&quot;/home/jenkins/extra-files/installer_content&q=
uot;<br>
TEST_SCRIPTS=3D&quot;$SCRIPTS_ROOT/test-scripts&quot;<br>
TEST_SCRIPTS_TGT=3D&quot;home/root/test-scripts&quot;<br>
TEST_LOCAL_IFACE=3D&quot;eth1&quot;<br>
OPENTEST_CLI=3D&quot;$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz&quot;<br>
OPENTEST_TEE_IP=3D&quot;10.218.102.142&quot;<br>
RUN_BUILD_TESTS=3D&quot;true&quot;<br>
STAF_ROOT=3D&quot;/usr/local/staf&quot;<br>
SKIP_TEST_FAILURES=3D&quot;false&quot;<br>
PRODUCTIZE_SDK=3D&quot;false&quot;<br>
BITBAKE_COMMAND=3D&quot;arago-core-tisdk-image&quot;<br>
RESULTS_CONFIG_COMMENTS=3D&quot;false&quot;<br>
INSTALL_JAMMER=3D&quot;/home/jenkins/installjammer&quot;<br>
INSTALLER_ROOT=3D&quot;$BUILD_ROOT/installer&quot;<br>
MPI_FILE=3D&quot;$SCRIPTS_ROOT/mpi-files/ti-sdk-base.mpi&quot;<br>
SD_CARD_CONTENT=3D&quot;/home/jenkins/extra-files/sd_content&quot;<br>
PACKAGE_BOOT_UIMAGE=3D&quot;false&quot;<br>
WEBGEN_ROOT=3D&quot;/home/jenkins/webgen&quot;<br>
WEB_EXTRAS_ROOT=3D&quot;/home/jenkins/extra-files/web_content&quot;<br>
WEBGEN_MAK_ROOT=3D&quot;$SCRIPTS_ROOT/publish-sdk-data&quot;<br>
COPY_TO_WEB=3D&quot;true&quot;<br>
WEB_HOST=3D&quot;&quot;<br>
CLEAN_AFTER_COPY=3D&quot;true&quot;<br>
BACKUP_RESULTS=3D&quot;/home/jenkins/jobs/arago-core-tisdk-nightly/workspac=
e&quot;<br>
</p>
</div>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE72E821DF5DLEE08entticom_--
