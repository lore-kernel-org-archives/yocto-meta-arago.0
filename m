Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.6839.1637640071040562593
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 Nov 2021 20:01:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7259440C93;
	Tue, 23 Nov 2021 04:01:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GLIITf4mxVQH; Tue, 23 Nov 2021 04:01:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2BE2140C1C;
	Tue, 23 Nov 2021 04:01:08 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 04A411746E2;
	Mon, 22 Nov 2021 23:01:05 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: j-humphreys@ti.com,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [tisdk-build-scripts][PATCH 02/10] Remove old webgen makefiles for very old AMSDK and CoreSDK releases
Date: Mon, 22 Nov 2021 23:00:51 -0500
Message-Id: <1637640060-31733-15-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637640060-31733-1-git-send-email-denis@denix.org>
References: <1637640060-31733-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 installer-files/tisdk.xml                          | 220 ---------------=
------
 .../amsdk/05.06.00.00/am335x-evm/webgen.mak        |  33 ----
 .../amsdk/05.07.00.00/am180x-evm/webgen.mak        |  29 ---
 .../amsdk/05.07.00.00/am335x-evm/webgen.mak        |  32 ---
 .../amsdk/05.07.00.00/am3517-evm/webgen.mak        |  31 ---
 .../amsdk/05.07.00.00/am37x-evm/webgen.mak         |  31 ---
 .../amsdk/05.07.00.00/beagleboard/webgen.mak       |  29 ---
 .../amsdk/06.00.00.00/am180x-evm/webgen.mak        |  29 ---
 .../amsdk/06.00.00.00/am335x-evm/webgen.mak        |  34 ----
 .../amsdk/06.00.00.00/am3517-evm/webgen.mak        |  31 ---
 .../amsdk/06.00.00.00/am37x-evm/webgen.mak         |  31 ---
 .../amsdk/06.00.00.00/beagleboard/webgen.mak       |  29 ---
 .../amsdk/07.00.00.00/am335x-evm/webgen.mak        |  39 ----
 .../amsdk/07.00.00.00/am437x-evm/webgen.mak        |  36 ----
 .../amsdk/07.01.00.00/am437x-evm/webgen.mak        |  38 ----
 .../amsdk/08.00.00.00/am335x-evm/webgen.mak        |  39 ----
 .../amsdk/08.00.00.00/am437x-evm/webgen.mak        |  40 ----
 .../amsdk/08.00.00.00/am57xx-evm/webgen.mak        |  38 ----
 .../coresdk/2013.04.00/am335x-evm/webgen.mak       |  29 ---
 .../coresdk/2013.04.00/dra7xx-evm/webgen.mak       |  27 ---
 .../coresdk/2013.04.00/omap5-evm/webgen.mak        |  26 ---
 .../coresdk/2013.04.01/am335x-evm/webgen.mak       |  29 ---
 .../coresdk/2013.04.02/dra7xx-evm/webgen.mak       |  27 ---
 .../coresdk/2013.04.02/omap5-evm/webgen.mak        |  26 ---
 .../coresdk/2013.10.00/am335x-evm/webgen.mak       |  29 ---
 .../coresdk/2013.10.00/am437x-evm/webgen.mak       |  29 ---
 .../coresdk/2013.10.00/dra7xx-evm/webgen.mak       |  29 ---
 .../coresdk/2013.10.00/omap5-evm/webgen.mak        |  28 ---
 .../coresdk/2013.12.00/am335x-evm/webgen.mak       |  29 ---
 .../coresdk/2013.12.00/am437x-evm/webgen.mak       |  29 ---
 .../coresdk/2013.12.00/dra7xx-evm/webgen.mak       |  29 ---
 .../coresdk/2013.12.00/omap5-evm/webgen.mak        |  28 ---
 .../coresdk/2013.12.01/am335x-evm/webgen.mak       |  29 ---
 .../coresdk/2013.12.01/am437x-evm/webgen.mak       |  29 ---
 .../coresdk/2013.12.01/dra7xx-evm/webgen.mak       |  29 ---
 .../coresdk/2013.12.01/omap5-evm/webgen.mak        |  28 ---
 .../coresdk/2014.08.00/am335x-evm/webgen.mak       |  28 ---
 .../coresdk/2014.08.00/am437x-evm/webgen.mak       |  28 ---
 .../coresdk/2014.08.00/am57xx-evm/webgen.mak       |  28 ---
 .../coresdk/2014.08.00/dra7xx-evm/webgen.mak       |  28 ---
 .../coresdk/2014.08.00/k2hk-evm/webgen.mak         |  28 ---
 .../coresdk/2014.10.01/am335x-evm/webgen.mak       |  28 ---
 .../coresdk/2014.10.01/am437x-evm/webgen.mak       |  28 ---
 .../coresdk/2014.10.01/am57xx-evm/webgen.mak       |  28 ---
 .../coresdk/2014.10.01/dra7xx-evm/webgen.mak       |  28 ---
 .../coresdk/2014.10.01/k2hk-evm/webgen.mak         |  28 ---
 .../coresdk/2015.01/am335x-evm/webgen.mak          |  28 ---
 .../coresdk/2015.01/am437x-evm/webgen.mak          |  28 ---
 .../coresdk/2015.01/am57xx-evm/webgen.mak          |  28 ---
 .../coresdk/2015.01/dra7xx-evm/webgen.mak          |  28 ---
 .../coresdk/2015.01/k2e-evm/webgen.mak             |  28 ---
 .../coresdk/2015.01/k2hk-evm/webgen.mak            |  28 ---
 .../coresdk/2015.01/k2l-evm/webgen.mak             |  28 ---
 .../coresdk/2015.02/am335x-evm/webgen.mak          |  28 ---
 .../coresdk/2015.02/am437x-evm/webgen.mak          |  28 ---
 .../coresdk/2015.02/am57xx-evm/webgen.mak          |  28 ---
 .../coresdk/2015.02/dra7xx-evm/webgen.mak          |  28 ---
 .../coresdk/2015.02/k2e-evm/webgen.mak             |  28 ---
 .../coresdk/2015.02/k2g-evm/webgen.mak             |  28 ---
 .../coresdk/2015.02/k2hk-evm/webgen.mak            |  28 ---
 .../coresdk/2015.02/k2l-evm/webgen.mak             |  28 ---
 61 files changed, 1998 deletions(-)
 delete mode 100644 installer-files/tisdk.xml
 delete mode 100644 publish-sdk-data/amsdk/05.06.00.00/am335x-evm/webgen.=
mak
 delete mode 100644 publish-sdk-data/amsdk/05.07.00.00/am180x-evm/webgen.=
mak
 delete mode 100644 publish-sdk-data/amsdk/05.07.00.00/am335x-evm/webgen.=
mak
 delete mode 100644 publish-sdk-data/amsdk/05.07.00.00/am3517-evm/webgen.=
mak
 delete mode 100644 publish-sdk-data/amsdk/05.07.00.00/am37x-evm/webgen.m=
ak
 delete mode 100644 publish-sdk-data/amsdk/05.07.00.00/beagleboard/webgen=
.mak
 delete mode 100644 publish-sdk-data/amsdk/06.00.00.00/am180x-evm/webgen.=
mak
 delete mode 100644 publish-sdk-data/amsdk/06.00.00.00/am335x-evm/webgen.=
mak
 delete mode 100644 publish-sdk-data/amsdk/06.00.00.00/am3517-evm/webgen.=
mak
 delete mode 100644 publish-sdk-data/amsdk/06.00.00.00/am37x-evm/webgen.m=
ak
 delete mode 100644 publish-sdk-data/amsdk/06.00.00.00/beagleboard/webgen=
.mak
 delete mode 100644 publish-sdk-data/amsdk/07.00.00.00/am335x-evm/webgen.=
mak
 delete mode 100644 publish-sdk-data/amsdk/07.00.00.00/am437x-evm/webgen.=
mak
 delete mode 100644 publish-sdk-data/amsdk/07.01.00.00/am437x-evm/webgen.=
mak
 delete mode 100644 publish-sdk-data/amsdk/08.00.00.00/am335x-evm/webgen.=
mak
 delete mode 100644 publish-sdk-data/amsdk/08.00.00.00/am437x-evm/webgen.=
mak
 delete mode 100644 publish-sdk-data/amsdk/08.00.00.00/am57xx-evm/webgen.=
mak
 delete mode 100644 publish-sdk-data/coresdk/2013.04.00/am335x-evm/webgen=
.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.04.00/dra7xx-evm/webgen=
.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.04.00/omap5-evm/webgen.=
mak
 delete mode 100644 publish-sdk-data/coresdk/2013.04.01/am335x-evm/webgen=
.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.04.02/dra7xx-evm/webgen=
.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.04.02/omap5-evm/webgen.=
mak
 delete mode 100644 publish-sdk-data/coresdk/2013.10.00/am335x-evm/webgen=
.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.10.00/am437x-evm/webgen=
.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.10.00/dra7xx-evm/webgen=
.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.10.00/omap5-evm/webgen.=
mak
 delete mode 100644 publish-sdk-data/coresdk/2013.12.00/am335x-evm/webgen=
.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.12.00/am437x-evm/webgen=
.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.12.00/dra7xx-evm/webgen=
.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.12.00/omap5-evm/webgen.=
mak
 delete mode 100644 publish-sdk-data/coresdk/2013.12.01/am335x-evm/webgen=
.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.12.01/am437x-evm/webgen=
.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.12.01/dra7xx-evm/webgen=
.mak
 delete mode 100644 publish-sdk-data/coresdk/2013.12.01/omap5-evm/webgen.=
mak
 delete mode 100644 publish-sdk-data/coresdk/2014.08.00/am335x-evm/webgen=
.mak
 delete mode 100644 publish-sdk-data/coresdk/2014.08.00/am437x-evm/webgen=
.mak
 delete mode 100644 publish-sdk-data/coresdk/2014.08.00/am57xx-evm/webgen=
.mak
 delete mode 100644 publish-sdk-data/coresdk/2014.08.00/dra7xx-evm/webgen=
.mak
 delete mode 100644 publish-sdk-data/coresdk/2014.08.00/k2hk-evm/webgen.m=
ak
 delete mode 100644 publish-sdk-data/coresdk/2014.10.01/am335x-evm/webgen=
.mak
 delete mode 100644 publish-sdk-data/coresdk/2014.10.01/am437x-evm/webgen=
.mak
 delete mode 100644 publish-sdk-data/coresdk/2014.10.01/am57xx-evm/webgen=
.mak
 delete mode 100644 publish-sdk-data/coresdk/2014.10.01/dra7xx-evm/webgen=
.mak
 delete mode 100644 publish-sdk-data/coresdk/2014.10.01/k2hk-evm/webgen.m=
ak
 delete mode 100644 publish-sdk-data/coresdk/2015.01/am335x-evm/webgen.ma=
k
 delete mode 100644 publish-sdk-data/coresdk/2015.01/am437x-evm/webgen.ma=
k
 delete mode 100644 publish-sdk-data/coresdk/2015.01/am57xx-evm/webgen.ma=
k
 delete mode 100644 publish-sdk-data/coresdk/2015.01/dra7xx-evm/webgen.ma=
k
 delete mode 100644 publish-sdk-data/coresdk/2015.01/k2e-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2015.01/k2hk-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2015.01/k2l-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2015.02/am335x-evm/webgen.ma=
k
 delete mode 100644 publish-sdk-data/coresdk/2015.02/am437x-evm/webgen.ma=
k
 delete mode 100644 publish-sdk-data/coresdk/2015.02/am57xx-evm/webgen.ma=
k
 delete mode 100644 publish-sdk-data/coresdk/2015.02/dra7xx-evm/webgen.ma=
k
 delete mode 100644 publish-sdk-data/coresdk/2015.02/k2e-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2015.02/k2g-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2015.02/k2hk-evm/webgen.mak
 delete mode 100644 publish-sdk-data/coresdk/2015.02/k2l-evm/webgen.mak

diff --git a/installer-files/tisdk.xml b/installer-files/tisdk.xml
deleted file mode 100644
index 52f235f..0000000
--- a/installer-files/tisdk.xml
+++ /dev/null
@@ -1,220 +0,0 @@
-<project>
-    <shortName></shortName>
-    <fullName>${sdk_name_prefix}-${platform}-${sdk_version}</fullName>
-    <version>${sdk_version}</version>
-    <installerFilename>${sdk_name_prefix}-${platform}-${sdk_version}-Lin=
ux-x86-Install.bin</installerFilename>
-    <componentList>
-        <component>
-            <name>default</name>
-            <description>Default Component</description>
-            <canBeEdited>1</canBeEdited>
-            <selected>1</selected>
-            <show>1</show>
-            <folderList>
-                <folder>
-                    <description>Program Files</description>
-                    <destination>${InstallationDirectory}</destination>
-                    <name>programfiles</name>
-                    <platforms>all</platforms>
-                    <distributionFileList>
-                        <distributionFile>
-                            <origin>${sdk_loc}/${sdk_tar_name}</origin>
-                        </distributionFile>
-                    </distributionFileList>
-                </folder>
-                <folder>
-                    <description>Program Files</description>
-                    <destination>${InstallationDirectory}</destination>
-                    <name>programfileslinux</name>
-                    <platforms>linux</platforms>
-                </folder>
-            </folderList>
-        </component>
-    </componentList>
-    <postInstallationActionList>
-        <runProgram>
-            <program>tar</program>
-            <programArguments>-xzvf  "${InstallationDirectory}/${sdk_tar=
_name}" -C "${InstallationDirectory}"</programArguments>
-        </runProgram>
-        <runProgram>
-            <program>${InstallationDirectory}/sdk-install.sh</program>
-            <programArguments>--install_dir ${InstallationDirectory}</pr=
ogramArguments>
-        </runProgram>
-        <deleteFile>
-            <path>${InstallationDirectory}/${sdk_tar_name}</path>
-        </deleteFile>
-        <runProgram>
-            <program>${cssinstalldir}/ccs_install.sh</program>
-            <programArguments>${cssinstalldir} &amp;</programArguments>
-            <ruleList>
-                <isTrue>
-                    <value>${InstallCCS}</value>
-                </isTrue>
-            </ruleList>
-        </runProgram>
-    </postInstallationActionList>
-    <createUninstaller>0</createUninstaller>
-    <defaultInstallationMode>xwindow</defaultInstallationMode>
-    <disableSplashScreen>1</disableSplashScreen>
-    <enableRollback>1</enableRollback>
-    <enableTimestamp>1</enableTimestamp>
-    <height>400</height>
-    <outputDirectory>${output_dir}</outputDirectory>
-    <overrideGtkButtonText>1</overrideGtkButtonText>
-    <uninstallerDirectory></uninstallerDirectory>
-    <vendor>Texas Instruments</vendor>
-    <width>600</width>
-    <parameterList>
-        <infoParameter>
-            <name>RecommendedOS</name>
-            <title>Linux Environment Support Message</title>
-            <description></description>
-            <explanation></explanation>
-            <value>It is highly recommend that the user, or especially n=
ew users, install this SDK into a Ubuntu 14.04, Ubuntu 16.04, or Ubuntu 1=
8.04 distribution environment. This is the environment that was used to d=
evelop and test this SDK.
-
-Please note that this suggestion does not prevent the SDK from installin=
g on other Linux Distributions.</value>
-            <default></default>
-            <insertBefore>InstallationDirectory</insertBefore>
-            <trimMarginNumChars>0</trimMarginNumChars>
-        </infoParameter>
-        <infoParameter>
-            <name>GPLv3Info</name>
-            <title>GPLv3 Components Contained within SDK</title>
-            <description></description>
-            <explanation></explanation>
-            <value>This installation step is to inform you that there ar=
e software components within the SDK that are licensed as GPLv3. These so=
ftware components are for development purposes only, and are intended to =
be removed before installing the application(s) code in your final produc=
t. For more information please refer to the Software Developer's Guide (S=
DG) for more information on GPLv3 and removal instructions
-
-Please click "Next" to continue installation, or click "Cancel" to exit =
the SDK installation</value>
-            <default></default>
-            <insertBefore>InstallationDirectory</insertBefore>
-            <trimMarginNumChars>0</trimMarginNumChars>
-        </infoParameter>
-        <directoryParameter>
-            <name>InstallationDirectory</name>
-            <title>Choose Destination Location</title>
-            <description>Destination Folder</description>
-            <explanation>Setup will install ${sdk_name_prefix}-${platfor=
m} in the following folder.
-
-To install to this folder, click "Forward". To install to a different fo=
lder, click the browse icon and select another folder.</explanation>
-            <value></value>
-            <default>${platform_install_prefix}/${sdk_name_prefix}-${pla=
tform}-${sdk_version}</default>
-            <allowEmptyValue>0</allowEmptyValue>
-            <cliOptionName>prefix</cliOptionName>
-            <insertAfter>LinuxEnv</insertAfter>
-            <insertBefore>GPLv3</insertBefore>
-            <mustBeWritable>1</mustBeWritable>
-            <mustExist>0</mustExist>
-            <width>60</width>
-        </directoryParameter>
-        <infoParameter>
-            <name>InstallSummary</name>
-            <title>Review Installation Decisions</title>
-            <description>Setup has enough information to start copying t=
he program files. If you want to review or change any settings, click Bac=
k. If you are satisfied with the settings, click Next to begin copying fi=
les</description>
-            <explanation></explanation>
-            <value>Install Directory:
-	${InstallationDirectory}</value>
-            <default></default>
-            <trimMarginNumChars>0</trimMarginNumChars>
-            <preShowPageActionList>
-                <if>
-                    <explanation>sd</explanation>
-                    <actionList>
-                        <setInstallerVariable>
-                            <name>install_ccs</name>
-                            <value>Yes</value>
-                        </setInstallerVariable>
-                    </actionList>
-                    <conditionRuleList>
-                        <isTrue>
-                            <value>${InstallCCS}</value>
-                        </isTrue>
-                    </conditionRuleList>
-                    <elseActionList>
-                        <setInstallerVariable>
-                            <name>install_ccs</name>
-                            <value>No</value>
-                        </setInstallerVariable>
-                    </elseActionList>
-                </if>
-            </preShowPageActionList>
-        </infoParameter>
-        <stringParameter>
-            <name>platform</name>
-            <description></description>
-            <explanation></explanation>
-            <value></value>
-            <default></default>
-            <allowEmptyValue>0</allowEmptyValue>
-            <ask>0</ask>
-            <cliOptionShow>0</cliOptionShow>
-            <width>30</width>
-        </stringParameter>
-        <stringParameter>
-            <name>sdk_tar_name</name>
-            <description></description>
-            <explanation></explanation>
-            <value></value>
-            <default></default>
-            <allowEmptyValue>0</allowEmptyValue>
-            <ask>0</ask>
-            <cliOptionShow>0</cliOptionShow>
-            <width>30</width>
-        </stringParameter>
-        <stringParameter>
-            <name>sdk_size</name>
-            <description></description>
-            <explanation></explanation>
-            <value>1200</value>
-            <default></default>
-            <allowEmptyValue>0</allowEmptyValue>
-            <ask>0</ask>
-            <cliOptionShow>0</cliOptionShow>
-            <width>30</width>
-        </stringParameter>
-        <stringParameter>
-            <name>sdk_loc</name>
-            <description></description>
-            <explanation></explanation>
-            <value></value>
-            <default></default>
-            <allowEmptyValue>0</allowEmptyValue>
-            <ask>0</ask>
-            <cliOptionShow>0</cliOptionShow>
-            <width>30</width>
-        </stringParameter>
-        <stringParameter>
-            <name>sdk_name_prefix</name>
-            <description></description>
-            <explanation></explanation>
-            <value></value>
-            <default></default>
-            <allowEmptyValue>0</allowEmptyValue>
-            <ask>0</ask>
-            <cliOptionShow>0</cliOptionShow>
-            <width>30</width>
-        </stringParameter>
-        <stringParameter>
-            <name>output_dir</name>
-            <description></description>
-            <explanation></explanation>
-            <value></value>
-            <default></default>
-            <allowEmptyValue>0</allowEmptyValue>
-            <ask>0</ask>
-            <cliOptionShow>0</cliOptionShow>
-            <width>30</width>
-        </stringParameter>
-        <stringParameter>
-            <name>sdk_version</name>
-            <description></description>
-            <explanation></explanation>
-            <value></value>
-            <default></default>
-            <allowEmptyValue>0</allowEmptyValue>
-            <ask>0</ask>
-            <cliOptionShow>0</cliOptionShow>
-            <width>30</width>
-        </stringParameter>
-    </parameterList>
-</project>
-
diff --git a/publish-sdk-data/amsdk/05.06.00.00/am335x-evm/webgen.mak b/p=
ublish-sdk-data/amsdk/05.06.00.00/am335x-evm/webgen.mak
deleted file mode 100644
index 7d83113..0000000
--- a/publish-sdk-data/amsdk/05.06.00.00/am335x-evm/webgen.mak
+++ /dev/null
@@ -1,33 +0,0 @@
-PRODUCT_NAME=3DAM335xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM335xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>Thank you for downloading the AM335x Software Develo=
pment Kit (SDK).  This SDK supports both the AM335x EVM as well as the Be=
aglebone low-cost development platform.  In order to install the SDK, it =
is necessary to download all items listed under <b>AM335x SDK Essentials<=
/b>.<br><br>For installation instructions, please refer to the included S=
oftware Developers Guide (SDG) found under <b>SDK Components</b> or the l=
atest <a href=3D"http://processors.wiki.ti.com/index.php/Sitara_Linux_Sof=
tware_Developer=E2=80=99s_Guide">Wiki version</a> of the SDG.<br><br>This=
 SDK has changed from using a stand-alone Code Sourcery Lite toolchain to=
 using an integrated GCC 4.5-based toolchain built from Arago. There is n=
o longer a need to download a separate toolchain as the toolchain and too=
ls can now be found in the linux-devkit directory of the SDK<br>
-
-VERSION=3D05.06.00.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM335x SDK Essentials")
-	$(call add-link,"ti-sdk-am335x-evm-05.06.00.00-Linux-x86-Install.bin","=
ti-sdk-am335x-evm-05.06.00.00-Linux-x86-Install.bin","AM335x EVM SDK")
-	$(call add-divider,"AM335x SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.1.1.00033-Sitara-ARM.tar.gz",CCS-5.1.1.=
00033-Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM335x SDK Individual Components")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_SD=
K_Release_Notes","Sitara Linux SDK Release Notes","Link to Release Notes =
for Sitara Linux SDK")
-	$(call add-link,"am335x-evm-qsg.pdf","am335x-evm-qsg.pdf","AM335x EVM Q=
uick Start Guide")
-	$(call add-link,"am335x-evm-sk-qsg.pdf","am335x-evm-sk-qsg.pdf","AM335x=
 EVM-SK Quick Start Guide")
-	$(call add-link,"beaglebone-qsg.pdf","beaglebone-qsg.pdf","BeagleBone Q=
uick Start Guide")
-	$(call add-link,"sitara-linuxsdk-sdg-05.06.00.00.pdf", "sitara-linuxsdk=
-sdg-05.06.00.00.pdf", "Software Developers Guide")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_Software_Developer%E2%80%99s_Guide","Wiki version of Software Develop=
ers Guide","Link to the online Software Developers Guide which has the la=
test content")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-link,"am335x-evm-sdk-src-05.06.00.00.tar.gz","am335x-evm-sdk=
-src-05.06.00.00.tar.gz", "AM335x SDK PSP Source Code")
-	$(call add-link,"am335x-evm-sdk-bin-05.06.00.00.tar.gz","am335x-evm-sdk=
-bin-05.06.00.00.tar.gz", "AM335x SDK prebuilt PSP binaries and root file=
system")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-http-link,"http://software-dl.ti.com/dsps/dsps_public_sw/am_=
bu/sdk-downloads/TISDK-Downloads/ALL/index.html","SDK Download Files","Li=
nk to the download location where the downloaded sources used to build th=
e SDK are located")
-	$(call add-divider,"AM335x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/amsdk/05.07.00.00/am180x-evm/webgen.mak b/p=
ublish-sdk-data/amsdk/05.07.00.00/am180x-evm/webgen.mak
deleted file mode 100644
index 73368db..0000000
--- a/publish-sdk-data/amsdk/05.07.00.00/am180x-evm/webgen.mak
+++ /dev/null
@@ -1,29 +0,0 @@
-PRODUCT_NAME=3DAM180xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM180xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>Thank you for downloading the AM180x Software Develo=
pment Kit (SDK).  In order to install the SDK, it is necessary to downloa=
d all items listed under <b>AM180x SDK Essentials</b>.<br><br>For install=
ation instructions, please refer to the included Software Developers Guid=
e (SDG) found under <b>SDK Components</b> or the latest <a href=3D"http:/=
/processors.wiki.ti.com/index.php/Sitara_Linux_Software_Developer=E2=80=99=
s_Guide">Wiki version</a> of the SDG.<br><br>This SDK has changed from us=
ing a stand-alone Code Sourcery Lite toolchain to using an integrated GCC=
 4.5-based toolchain built from Arago. There is no longer a need to downl=
oad a separate toolchain as the toolchain and tools can now be found in t=
he linux-devkit directory of the SDK<br>
-
-VERSION=3D05.07.00.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM180x SDK Essentials")
-	$(call add-link,"ti-sdk-am180x-evm-05.07.00.00-Linux-x86-Install.bin","=
ti-sdk-am180x-evm-05.07.00.00-Linux-x86-Install.bin","AM180x EVM SDK")
-	$(call add-divider,"AM180x SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM180x SDK Individual Components")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_SD=
K_Release_Notes","Sitara Linux SDK Release Notes","Link to Release Notes =
for Sitara Linux SDK")
-	$(call add-link,"am180x-evm-qsg.pdf","am180x-evm-qsg.pdf","AM180x EVM Q=
uick Start Guide")
-	$(call add-link,"sitara-linuxsdk-sdg-05.07.00.00.pdf", "sitara-linuxsdk=
-sdg-05.07.00.00.pdf", "Software Developers Guide")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_Software_Developer%E2%80%99s_Guide","Wiki version of Software Develop=
ers Guide","Link to the online Software Developers Guide which has the la=
test content")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-link,"am180x-evm-sdk-src-05.07.00.00.tar.gz","am180x-evm-sdk=
-src-05.07.00.00.tar.gz", "AM180x SDK PSP Source Code")
-	$(call add-link,"am180x-evm-sdk-bin-05.07.00.00.tar.gz","am180x-evm-sdk=
-bin-05.07.00.00.tar.gz", "AM180x SDK prebuilt PSP binaries and root file=
system")
-	$(call add-divider,"AM180x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/amsdk/05.07.00.00/am335x-evm/webgen.mak b/p=
ublish-sdk-data/amsdk/05.07.00.00/am335x-evm/webgen.mak
deleted file mode 100644
index 33ab395..0000000
--- a/publish-sdk-data/amsdk/05.07.00.00/am335x-evm/webgen.mak
+++ /dev/null
@@ -1,32 +0,0 @@
-PRODUCT_NAME=3DAM335xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM335xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>Thank you for downloading the AM335x Software Develo=
pment Kit (SDK).  This SDK supports both the AM335x EVM as well as the Be=
aglebone low-cost development platform.  In order to install the SDK, it =
is necessary to download all items listed under <b>AM335x SDK Essentials<=
/b>.<br><br>For installation instructions, please refer to the included S=
oftware Developers Guide (SDG) found under <b>SDK Components</b> or the l=
atest <a href=3D"http://processors.wiki.ti.com/index.php/Sitara_Linux_Sof=
tware_Developer=E2=80=99s_Guide">Wiki version</a> of the SDG.<br><br>This=
 SDK has changed from using a stand-alone Code Sourcery Lite toolchain to=
 using an integrated GCC 4.5-based toolchain built from Arago. There is n=
o longer a need to download a separate toolchain as the toolchain and too=
ls can now be found in the linux-devkit directory of the SDK<br>
-
-VERSION=3D05.07.00.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM335x SDK Essentials")
-	$(call add-link,"ti-sdk-am335x-evm-05.07.00.00-Linux-x86-Install.bin","=
ti-sdk-am335x-evm-05.07.00.00-Linux-x86-Install.bin","AM335x EVM SDK")
-	$(call add-divider,"AM335x SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM335x SDK Individual Components")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_SD=
K_Release_Notes","Sitara Linux SDK Release Notes","Link to Release Notes =
for Sitara Linux SDK")
-	$(call add-link,"am335x-evm-qsg.pdf","am335x-evm-qsg.pdf","AM335x EVM Q=
uick Start Guide")
-	$(call add-link,"am335x-evm-sk-qsg.pdf","am335x-evm-sk-qsg.pdf","AM335x=
 EVM-SK Quick Start Guide")
-	$(call add-link,"beaglebone-qsg.pdf","beaglebone-qsg.pdf","BeagleBone Q=
uick Start Guide")
-	$(call add-link,"sitara-linuxsdk-sdg-05.07.00.00.pdf", "sitara-linuxsdk=
-sdg-05.07.00.00.pdf", "Software Developers Guide")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_Software_Developer%E2%80%99s_Guide","Wiki version of Software Develop=
ers Guide","Link to the online Software Developers Guide which has the la=
test content")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-link,"am335x-evm-sdk-src-05.07.00.00.tar.gz","am335x-evm-sdk=
-src-05.07.00.00.tar.gz", "AM335x SDK PSP Source Code")
-	$(call add-link,"am335x-evm-sdk-bin-05.07.00.00.tar.gz","am335x-evm-sdk=
-bin-05.07.00.00.tar.gz", "AM335x SDK prebuilt PSP binaries and root file=
system")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"AM335x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/amsdk/05.07.00.00/am3517-evm/webgen.mak b/p=
ublish-sdk-data/amsdk/05.07.00.00/am3517-evm/webgen.mak
deleted file mode 100644
index 004470c..0000000
--- a/publish-sdk-data/amsdk/05.07.00.00/am3517-evm/webgen.mak
+++ /dev/null
@@ -1,31 +0,0 @@
-PRODUCT_NAME=3DAM3517SDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM3517SDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>Thank you for downloading the AM3517 Software Develo=
pment Kit (SDK).  In order to install the SDK, it is necessary to downloa=
d all items listed under <b>AM3517 SDK Essentials</b>.<br><br>For install=
ation instructions, please refer to the included Software Developers Guid=
e (SDG) found under <b>SDK Components</b> or the latest <a href=3D"http:/=
/processors.wiki.ti.com/index.php/Sitara_Linux_Software_Developer=E2=80=99=
s_Guide">Wiki version</a> of the SDG.<br><br>This SDK has changed from us=
ing a stand-alone Code Sourcery Lite toolchain to using an integrated GCC=
 4.5-based toolchain built from Arago. There is no longer a need to downl=
oad a separate toolchain as the toolchain and tools can now be found in t=
he linux-devkit directory of the SDK<br>
-
-VERSION=3D05.07.00.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM3517 SDK Essentials")
-	$(call add-link,"ti-sdk-am3517-evm-05.07.00.00-Linux-x86-Install.bin","=
ti-sdk-am3517-evm-05.07.00.00-Linux-x86-Install.bin","AM3517 EVM SDK")
-	$(call add-divider,"AM3517 SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM3517 SDK Individual Components")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_SD=
K_Release_Notes","Sitara Linux SDK Release Notes","Link to Release Notes =
for Sitara Linux SDK")
-	$(call add-link,"am3517-evm-qsg.pdf","am3517-evm-qsg.pdf","AM3517 EVM Q=
uick Start Guide")
-	$(call add-link,"sitara-linuxsdk-sdg-05.07.00.00.pdf", "sitara-linuxsdk=
-sdg-05.07.00.00.pdf", "Software Developers Guide")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_Software_Developer%E2%80%99s_Guide","Wiki version of Software Develop=
ers Guide","Link to the online Software Developers Guide which has the la=
test content")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-link,"am3517-evm-sdk-src-05.07.00.00.tar.gz","am3517-evm-sdk=
-src-05.07.00.00.tar.gz", "AM3517 SDK PSP Source Code")
-	$(call add-link,"am3517-evm-sdk-bin-05.07.00.00.tar.gz","am3517-evm-sdk=
-bin-05.07.00.00.tar.gz", "AM3517 SDK prebuilt PSP binaries and root file=
system")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/fla=
shtool.html","Download Flashtool","Sitara Flash Programming Tool")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"AM3517 SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/amsdk/05.07.00.00/am37x-evm/webgen.mak b/pu=
blish-sdk-data/amsdk/05.07.00.00/am37x-evm/webgen.mak
deleted file mode 100644
index 8c15226..0000000
--- a/publish-sdk-data/amsdk/05.07.00.00/am37x-evm/webgen.mak
+++ /dev/null
@@ -1,31 +0,0 @@
-PRODUCT_NAME=3DAM37xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM37xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>Thank you for downloading the AM37x Software Develop=
ment Kit (SDK).  In order to install the SDK, it is necessary to download=
 all items listed under <b>AM37x SDK Essentials</b>.<br><br>For installat=
ion instructions, please refer to the included Software Developers Guide =
(SDG) found under <b>SDK Components</b> or the latest <a href=3D"http://p=
rocessors.wiki.ti.com/index.php/Sitara_Linux_Software_Developer=E2=80=99s=
_Guide">Wiki version</a> of the SDG.<br><br>This SDK has changed from usi=
ng a stand-alone Code Sourcery Lite toolchain to using an integrated GCC =
4.5-based toolchain built from Arago. There is no longer a need to downlo=
ad a separate toolchain as the toolchain and tools can now be found in th=
e linux-devkit directory of the SDK<br>
-
-VERSION=3D05.07.00.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM37x SDK Essentials")
-	$(call add-link,"ti-sdk-am37x-evm-05.07.00.00-Linux-x86-Install.bin","t=
i-sdk-am37x-evm-05.07.00.00-Linux-x86-Install.bin","AM37x EVM SDK")
-	$(call add-divider,"AM37x SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM37x SDK Individual Components")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_SD=
K_Release_Notes","Sitara Linux SDK Release Notes","Link to Release Notes =
for Sitara Linux SDK")
-	$(call add-link,"am37x-evm-qsg.pdf","am37x-evm-qsg.pdf","AM37x EVM Quic=
k Start Guide")
-	$(call add-link,"sitara-linuxsdk-sdg-05.07.00.00.pdf", "sitara-linuxsdk=
-sdg-05.07.00.00.pdf", "Software Developers Guide")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_Software_Developer%E2%80%99s_Guide","Wiki version of Software Develop=
ers Guide","Link to the online Software Developers Guide which has the la=
test content")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-link,"am37x-evm-sdk-src-05.07.00.00.tar.gz","am37x-evm-sdk-s=
rc-05.07.00.00.tar.gz", "AM37x SDK PSP Source Code")
-	$(call add-link,"am37x-evm-sdk-bin-05.07.00.00.tar.gz","am37x-evm-sdk-b=
in-05.07.00.00.tar.gz", "AM37x SDK prebuilt PSP binaries and root filesys=
tem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/fla=
shtool.html","Download Flashtool","Sitara Flash Programming Tool")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"AM37x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/amsdk/05.07.00.00/beagleboard/webgen.mak b/=
publish-sdk-data/amsdk/05.07.00.00/beagleboard/webgen.mak
deleted file mode 100644
index 998f34f..0000000
--- a/publish-sdk-data/amsdk/05.07.00.00/beagleboard/webgen.mak
+++ /dev/null
@@ -1,29 +0,0 @@
-PRODUCT_NAME=3DBeagleBoardSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DBeagleBoardSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>Thank you for downloading the BeagleBoard Software D=
evelopment Kit (SDK).  In order to install the SDK, it is necessary to do=
wnload all items listed under <b>BeagleBoard SDK Essentials</b>.<br><br>F=
or installation instructions, please refer to the included Software Devel=
opers Guide (SDG) found under <b>SDK Components</b> or the latest <a href=
=3D"http://processors.wiki.ti.com/index.php/Sitara_Linux_Software_Develop=
er=E2=80=99s_Guide">Wiki version</a> of the SDG.<br><br>This SDK has chan=
ged from using a stand-alone Code Sourcery Lite toolchain to using an int=
egrated GCC 4.5-based toolchain built from Arago. There is no longer a ne=
ed to download a separate toolchain as the toolchain and tools can now be=
 found in the linux-devkit directory of the SDK<br>
-
-VERSION=3D05.07.00.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"BeagleBoard SDK Essentials")
-	$(call add-link,"ti-sdk-beagleboard-05.07.00.00-Linux-x86-Install.bin",=
"ti-sdk-beagleboard-05.07.00.00-Linux-x86-Install.bin","BeagleBoard EVM S=
DK")
-	$(call add-divider,"BeagleBoard SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"BeagleBoard SDK Individual Components")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_SD=
K_Release_Notes","Sitara Linux SDK Release Notes","Link to Release Notes =
for Sitara Linux SDK")
-	$(call add-link,"sitara-linuxsdk-sdg-05.07.00.00.pdf", "sitara-linuxsdk=
-sdg-05.07.00.00.pdf", "Software Developers Guide")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_Software_Developer%E2%80%99s_Guide","Wiki version of Software Develop=
ers Guide","Link to the online Software Developers Guide which has the la=
test content")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-link,"beagleboard-sdk-src-05.07.00.00.tar.gz","beagleboard-s=
dk-src-05.07.00.00.tar.gz", "BeagleBoard SDK PSP Source Code")
-	$(call add-link,"beagleboard-sdk-bin-05.07.00.00.tar.gz","beagleboard-s=
dk-bin-05.07.00.00.tar.gz", "BeagleBoard SDK prebuilt PSP binaries and ro=
ot filesystem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"BeagleBoard SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/amsdk/06.00.00.00/am180x-evm/webgen.mak b/p=
ublish-sdk-data/amsdk/06.00.00.00/am180x-evm/webgen.mak
deleted file mode 100644
index d7e01c9..0000000
--- a/publish-sdk-data/amsdk/06.00.00.00/am180x-evm/webgen.mak
+++ /dev/null
@@ -1,29 +0,0 @@
-PRODUCT_NAME=3DAM180xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM180xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>Thank you for downloading the AM180x Software Develo=
pment Kit (SDK).  In order to install the SDK, it is necessary to downloa=
d all items listed under <b>AM180x SDK Essentials</b>.<br><br>For install=
ation instructions, please refer to the included Software Developers Guid=
e (SDG) found under <b>SDK Components</b> or the latest <a href=3D"http:/=
/processors.wiki.ti.com/index.php/Sitara_Linux_Software_Developer=E2=80=99=
s_Guide">Wiki version</a> of the SDG.<br><br>This SDK has changed from us=
ing a stand-alone Code Sourcery Lite toolchain to using an integrated GCC=
 4.5-based toolchain built from Arago. There is no longer a need to downl=
oad a separate toolchain as the toolchain and tools can now be found in t=
he linux-devkit directory of the SDK<br>
-
-VERSION=3D06.00.00.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM180x SDK Essentials")
-	$(call add-link,"ti-sdk-am180x-evm-06.00.00.00-Linux-x86-Install.bin","=
ti-sdk-am180x-evm-06.00.00.00-Linux-x86-Install.bin","AM180x EVM SDK")
-	$(call add-divider,"AM180x SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM180x SDK Individual Components")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_SD=
K_Release_Notes","Sitara Linux SDK Release Notes","Link to Release Notes =
for Sitara Linux SDK")
-	$(call add-link,"am180x-evm-qsg.pdf","am180x-evm-qsg.pdf","AM180x EVM Q=
uick Start Guide")
-	$(call add-link,"sitara-linuxsdk-sdg-06.00.00.00.pdf", "sitara-linuxsdk=
-sdg-06.00.00.00.pdf", "Software Developers Guide")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_Software_Developer%E2%80%99s_Guide","Wiki version of Software Develop=
ers Guide","Link to the online Software Developers Guide which has the la=
test content")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-link,"am180x-evm-sdk-src-06.00.00.00.tar.gz","am180x-evm-sdk=
-src-06.00.00.00.tar.gz", "AM180x SDK PSP Source Code")
-	$(call add-link,"am180x-evm-sdk-bin-06.00.00.00.tar.gz","am180x-evm-sdk=
-bin-06.00.00.00.tar.gz", "AM180x SDK prebuilt PSP binaries and root file=
system")
-	$(call add-divider,"AM180x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/amsdk/06.00.00.00/am335x-evm/webgen.mak b/p=
ublish-sdk-data/amsdk/06.00.00.00/am335x-evm/webgen.mak
deleted file mode 100644
index 42b6ae1..0000000
--- a/publish-sdk-data/amsdk/06.00.00.00/am335x-evm/webgen.mak
+++ /dev/null
@@ -1,34 +0,0 @@
-PRODUCT_NAME=3DAM335xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM335xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>Thank you for downloading the AM335x Software Develo=
pment Kit (SDK).  This SDK supports both the AM335x EVM as well as the Be=
aglebone low-cost development platform.  In order to install the SDK, it =
is necessary to download all items listed under <b>AM335x SDK Essentials<=
/b>.<br><br>For installation instructions, please refer to the included S=
oftware Developers Guide (SDG) found under <b>SDK Components</b> or the l=
atest <a href=3D"http://processors.wiki.ti.com/index.php/Sitara_Linux_Sof=
tware_Developer=E2=80=99s_Guide">Wiki version</a> of the SDG.<br><br>This=
 SDK has changed from using a stand-alone Code Sourcery Lite toolchain to=
 using an integrated GCC 4.5-based toolchain built from Arago. There is n=
o longer a need to download a separate toolchain as the toolchain and too=
ls can now be found in the linux-devkit directory of the SDK<br>
-
-VERSION=3D06.00.00.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM335x SDK Essentials")
-	$(call add-link,"ti-sdk-am335x-evm-06.00.00.00-Linux-x86-Install.bin","=
ti-sdk-am335x-evm-06.00.00.00-Linux-x86-Install.bin","AM335x EVM SDK")
-	$(call add-divider,"AM335x SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM335x SDK Wilink 8 Addon Package")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/WL8_relea=
se_download_page","Wilink 8 Addon Package","Wilink 8 Addon Package")
-	$(call add-divider,"AM335x SDK Individual Components")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_SD=
K_Release_Notes","Sitara Linux SDK Release Notes","Link to Release Notes =
for Sitara Linux SDK")
-	$(call add-link,"am335x-evm-qsg.pdf","am335x-evm-qsg.pdf","AM335x EVM Q=
uick Start Guide")
-	$(call add-link,"am335x-evm-sk-qsg.pdf","am335x-evm-sk-qsg.pdf","AM335x=
 EVM-SK Quick Start Guide")
-	$(call add-link,"beaglebone-qsg.pdf","beaglebone-qsg.pdf","BeagleBone Q=
uick Start Guide")
-	$(call add-link,"sitara-linuxsdk-sdg-06.00.00.00.pdf", "sitara-linuxsdk=
-sdg-06.00.00.00.pdf", "Software Developers Guide")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_Software_Developer%E2%80%99s_Guide","Wiki version of Software Develop=
ers Guide","Link to the online Software Developers Guide which has the la=
test content")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-link,"am335x-evm-sdk-src-06.00.00.00.tar.gz","am335x-evm-sdk=
-src-06.00.00.00.tar.gz", "AM335x SDK PSP Source Code")
-	$(call add-link,"am335x-evm-sdk-bin-06.00.00.00.tar.gz","am335x-evm-sdk=
-bin-06.00.00.00.tar.gz", "AM335x SDK prebuilt PSP binaries and root file=
system")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"AM335x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/amsdk/06.00.00.00/am3517-evm/webgen.mak b/p=
ublish-sdk-data/amsdk/06.00.00.00/am3517-evm/webgen.mak
deleted file mode 100644
index 68a0029..0000000
--- a/publish-sdk-data/amsdk/06.00.00.00/am3517-evm/webgen.mak
+++ /dev/null
@@ -1,31 +0,0 @@
-PRODUCT_NAME=3DAM3517SDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM3517SDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>Thank you for downloading the AM3517 Software Develo=
pment Kit (SDK).  In order to install the SDK, it is necessary to downloa=
d all items listed under <b>AM3517 SDK Essentials</b>.<br><br>For install=
ation instructions, please refer to the included Software Developers Guid=
e (SDG) found under <b>SDK Components</b> or the latest <a href=3D"http:/=
/processors.wiki.ti.com/index.php/Sitara_Linux_Software_Developer=E2=80=99=
s_Guide">Wiki version</a> of the SDG.<br><br>This SDK has changed from us=
ing a stand-alone Code Sourcery Lite toolchain to using an integrated GCC=
 4.5-based toolchain built from Arago. There is no longer a need to downl=
oad a separate toolchain as the toolchain and tools can now be found in t=
he linux-devkit directory of the SDK<br>
-
-VERSION=3D06.00.00.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM3517 SDK Essentials")
-	$(call add-link,"ti-sdk-am3517-evm-06.00.00.00-Linux-x86-Install.bin","=
ti-sdk-am3517-evm-06.00.00.00-Linux-x86-Install.bin","AM3517 EVM SDK")
-	$(call add-divider,"AM3517 SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM3517 SDK Individual Components")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_SD=
K_Release_Notes","Sitara Linux SDK Release Notes","Link to Release Notes =
for Sitara Linux SDK")
-	$(call add-link,"am3517-evm-qsg.pdf","am3517-evm-qsg.pdf","AM3517 EVM Q=
uick Start Guide")
-	$(call add-link,"sitara-linuxsdk-sdg-06.00.00.00.pdf", "sitara-linuxsdk=
-sdg-06.00.00.00.pdf", "Software Developers Guide")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_Software_Developer%E2%80%99s_Guide","Wiki version of Software Develop=
ers Guide","Link to the online Software Developers Guide which has the la=
test content")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-link,"am3517-evm-sdk-src-06.00.00.00.tar.gz","am3517-evm-sdk=
-src-06.00.00.00.tar.gz", "AM3517 SDK PSP Source Code")
-	$(call add-link,"am3517-evm-sdk-bin-06.00.00.00.tar.gz","am3517-evm-sdk=
-bin-06.00.00.00.tar.gz", "AM3517 SDK prebuilt PSP binaries and root file=
system")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/fla=
shtool.html","Download Flashtool","Sitara Flash Programming Tool")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"AM3517 SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/amsdk/06.00.00.00/am37x-evm/webgen.mak b/pu=
blish-sdk-data/amsdk/06.00.00.00/am37x-evm/webgen.mak
deleted file mode 100644
index 9d17ac7..0000000
--- a/publish-sdk-data/amsdk/06.00.00.00/am37x-evm/webgen.mak
+++ /dev/null
@@ -1,31 +0,0 @@
-PRODUCT_NAME=3DAM37xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM37xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>Thank you for downloading the AM37x Software Develop=
ment Kit (SDK).  In order to install the SDK, it is necessary to download=
 all items listed under <b>AM37x SDK Essentials</b>.<br><br>For installat=
ion instructions, please refer to the included Software Developers Guide =
(SDG) found under <b>SDK Components</b> or the latest <a href=3D"http://p=
rocessors.wiki.ti.com/index.php/Sitara_Linux_Software_Developer=E2=80=99s=
_Guide">Wiki version</a> of the SDG.<br><br>This SDK has changed from usi=
ng a stand-alone Code Sourcery Lite toolchain to using an integrated GCC =
4.5-based toolchain built from Arago. There is no longer a need to downlo=
ad a separate toolchain as the toolchain and tools can now be found in th=
e linux-devkit directory of the SDK<br>
-
-VERSION=3D06.00.00.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM37x SDK Essentials")
-	$(call add-link,"ti-sdk-am37x-evm-06.00.00.00-Linux-x86-Install.bin","t=
i-sdk-am37x-evm-06.00.00.00-Linux-x86-Install.bin","AM37x EVM SDK")
-	$(call add-divider,"AM37x SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM37x SDK Individual Components")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_SD=
K_Release_Notes","Sitara Linux SDK Release Notes","Link to Release Notes =
for Sitara Linux SDK")
-	$(call add-link,"am37x-evm-qsg.pdf","am37x-evm-qsg.pdf","AM37x EVM Quic=
k Start Guide")
-	$(call add-link,"sitara-linuxsdk-sdg-06.00.00.00.pdf", "sitara-linuxsdk=
-sdg-06.00.00.00.pdf", "Software Developers Guide")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_Software_Developer%E2%80%99s_Guide","Wiki version of Software Develop=
ers Guide","Link to the online Software Developers Guide which has the la=
test content")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-link,"am37x-evm-sdk-src-06.00.00.00.tar.gz","am37x-evm-sdk-s=
rc-06.00.00.00.tar.gz", "AM37x SDK PSP Source Code")
-	$(call add-link,"am37x-evm-sdk-bin-06.00.00.00.tar.gz","am37x-evm-sdk-b=
in-06.00.00.00.tar.gz", "AM37x SDK prebuilt PSP binaries and root filesys=
tem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/fla=
shtool.html","Download Flashtool","Sitara Flash Programming Tool")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"AM37x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/amsdk/06.00.00.00/beagleboard/webgen.mak b/=
publish-sdk-data/amsdk/06.00.00.00/beagleboard/webgen.mak
deleted file mode 100644
index cf951eb..0000000
--- a/publish-sdk-data/amsdk/06.00.00.00/beagleboard/webgen.mak
+++ /dev/null
@@ -1,29 +0,0 @@
-PRODUCT_NAME=3DBeagleBoardSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DBeagleBoardSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>Thank you for downloading the BeagleBoard Software D=
evelopment Kit (SDK).  In order to install the SDK, it is necessary to do=
wnload all items listed under <b>BeagleBoard SDK Essentials</b>.<br><br>F=
or installation instructions, please refer to the included Software Devel=
opers Guide (SDG) found under <b>SDK Components</b> or the latest <a href=
=3D"http://processors.wiki.ti.com/index.php/Sitara_Linux_Software_Develop=
er=E2=80=99s_Guide">Wiki version</a> of the SDG.<br><br>This SDK has chan=
ged from using a stand-alone Code Sourcery Lite toolchain to using an int=
egrated GCC 4.5-based toolchain built from Arago. There is no longer a ne=
ed to download a separate toolchain as the toolchain and tools can now be=
 found in the linux-devkit directory of the SDK<br>
-
-VERSION=3D06.00.00.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"BeagleBoard SDK Essentials")
-	$(call add-link,"ti-sdk-beagleboard-06.00.00.00-Linux-x86-Install.bin",=
"ti-sdk-beagleboard-06.00.00.00-Linux-x86-Install.bin","BeagleBoard EVM S=
DK")
-	$(call add-divider,"BeagleBoard SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"BeagleBoard SDK Individual Components")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_SD=
K_Release_Notes","Sitara Linux SDK Release Notes","Link to Release Notes =
for Sitara Linux SDK")
-	$(call add-link,"sitara-linuxsdk-sdg-06.00.00.00.pdf", "sitara-linuxsdk=
-sdg-06.00.00.00.pdf", "Software Developers Guide")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_Software_Developer%E2%80%99s_Guide","Wiki version of Software Develop=
ers Guide","Link to the online Software Developers Guide which has the la=
test content")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-link,"beagleboard-sdk-src-06.00.00.00.tar.gz","beagleboard-s=
dk-src-06.00.00.00.tar.gz", "BeagleBoard SDK PSP Source Code")
-	$(call add-link,"beagleboard-sdk-bin-06.00.00.00.tar.gz","beagleboard-s=
dk-bin-06.00.00.00.tar.gz", "BeagleBoard SDK prebuilt PSP binaries and ro=
ot filesystem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"BeagleBoard SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/amsdk/07.00.00.00/am335x-evm/webgen.mak b/p=
ublish-sdk-data/amsdk/07.00.00.00/am335x-evm/webgen.mak
deleted file mode 100644
index 4ffb282..0000000
--- a/publish-sdk-data/amsdk/07.00.00.00/am335x-evm/webgen.mak
+++ /dev/null
@@ -1,39 +0,0 @@
-PRODUCT_NAME=3DAM335xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM335xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3DThank you for your interest in the AM335x Software Devel=
opment Kit (SDK). This SDK supports the  AM335x EVM <a href=3D"http://www=
.ti.com/tool/tmdxevm3358">TMDXEVM3358</a> and the AM335x StarterKit <a hr=
ef=3D"http://www.ti.com/tool/tmdssk3358">TMDSSK3358</a> from TI, as well =
as the very popular <a href=3D"http://beagleboard.org/Products/BeagleBone=
">Beaglebone</a> and <a href=3D"http://beagleboard.org/Products/BeagleBon=
e%20Black">Beaglebone Black</a> community boards. If you would like to in=
stall the full SDK on a Linux Host computer for development, you=E2=80=99=
ll need the AM335x SDK Essentials below. If you would like to evaluate th=
e SDK by running it on one of the above platforms and you prefer not to i=
nstall the full SDK at this time, please see the AM335x SDK SD Card Creat=
ion section below.<br><br>If you=E2=80=99d like more information on all o=
f these choices, please refer to the Sitara Linux SDK Getting Started Gui=
de (GSG) below or the latest version <a href=3D"http://processors
 .wiki.ti.com/index.php/Sitara_Linux_SDK_Getting_Started_Guide">here</a>.=
 For a complete overview of the SDK, please refer to the Sitara Linux SDK=
 Software Devloper=E2=80=99s Guide (SDG) below or the latest version <a h=
ref=3D"http://processors.wiki.ti.com/index.php/Sitara_Linux_Software_Deve=
loper%E2%80%99s_Guide">here</a>.
-
-VERSION=3D07.00.00.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-
-.prod_links:
-	$(call add-divider,"AM335x SDK Essentials")
-	$(call add-link,"ti-sdk-am335x-evm-07.00.00.00-Linux-x86-Install.bin","=
ti-sdk-am335x-evm-07.00.00.00-Linux-x86-Install.bin","AM335x EVM SDK \(32=
-bit Binary\)")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_SDK_64_Bit_Ubuntu_Support","Adding support for 64-bit Operating Syste=
ms","Instructions for users using a 64-bit version of Ubuntu")
-	$(call add-divider,"AM335x SDK Optional Addons")
-	$(call add-http-link,"#","Code Composer Studio 6","Link to Code Compose=
r Studio 6 \(Coming Soon\)")
-	$(call add-divider,"AM335x SDK SD Card Creation")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_SDK_Creating_a_SD_Card_with_Windows","Windows SD Card Creation Wiki",=
"Instructions for creating an SD Card with Windows")
-	$(call add-link,"sitara_linux_sdk_image_am335x.img.zip","sitara_linux_s=
dk_am335x.img.zip","Only used when creating an SD Card on Windows")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_SDK_Creating_a_SD_Card_with_Linux","Linux SD Card Creation Wiki","Ins=
tructions for creating an SD Card with Linux")
-	$(call add-divider,"AM335x SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"am335x-evm-sdk-src-07.00.00.00.tar.gz","am335x-evm-sdk=
-src-07.00.00.00.tar.gz", "AM335x SDK BSP Source Code")
-	$(call add-link,"am335x-evm-sdk-bin-07.00.00.00.tar.gz","am335x-evm-sdk=
-bin-07.00.00.00.tar.gz", "AM335x SDK prebuilt BSP binaries and root file=
system")
-	$(call add-divider,"AM335x SDK Documentation")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_SD=
K_Release_Notes","Sitara Linux SDK Release Notes","Link to Release Notes =
for Sitara Linux SDK")
-	$(call add-link,"am335x-evm-qsg.pdf","am335x-evm-qsg.pdf","AM335x EVM Q=
uick Start Guide")
-	$(call add-link,"am335x-evm-sk-qsg.pdf","am335x-evm-sk-qsg.pdf","AM335x=
 EVM-SK Quick Start Guide")
-	$(call add-link,"sitara-linuxsdk-gsg-07.00.00.00.pdf","sitara-linuxsdk-=
gsg-07.00.00.00.pdf", "Getting Started Guide")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_Software_Developer%E2%80%99s_Guide","Wiki version of Software Develop=
ers Guide","Link to the online Software Developers Guide which has the la=
test content")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"AM335x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
-	$(call add-divider,"Previous SDK Link")
-	$(call add-http-link,"http://software-dl.ti.com/sitara_linux/esd/AM335x=
SDK/06_00_00_00/index_FDS.html","AM335x v6.00 Download","Link to AM335x S=
DK 06.00.00.00 Download Page")
-
diff --git a/publish-sdk-data/amsdk/07.00.00.00/am437x-evm/webgen.mak b/p=
ublish-sdk-data/amsdk/07.00.00.00/am437x-evm/webgen.mak
deleted file mode 100644
index ccc0186..0000000
--- a/publish-sdk-data/amsdk/07.00.00.00/am437x-evm/webgen.mak
+++ /dev/null
@@ -1,36 +0,0 @@
-PRODUCT_NAME=3DAM437xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM437xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>Thank you for downloading the AM437x Software Develo=
pment Kit (SDK).  This SDK supports the AM437x EVM.  In order to install =
the SDK, it is necessary to download all items listed under <b>AM437x SDK=
 Essentials</b>.<br><br>For installation instructions, please refer to th=
e included Software Developers Guide (SDG) found under <b>SDK Components<=
/b> or the latest <a href=3D"http://processors.wiki.ti.com/index.php/Sita=
ra_Linux_Software_Developer=E2=80=99s_Guide">Wiki version</a> of the SDG.
-
-VERSION=3D07.00.00.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM437x SDK Essentials")
-	$(call add-link,"ti-sdk-am437x-evm-07.00.00.00-Linux-x86-Install.bin","=
ti-sdk-am437x-evm-07.00.00.00-Linux-x86-Install.bin","AM437x EVM SDK \(32=
-bit Binary\)")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_SDK_64_Bit_Ubuntu_Support","Adding support for 64-bit Operating Syste=
ms","Instructions for users using a 64-bit version of Ubuntu")
-	$(call add-divider,"AM437x SDK Optional Addons")
-	$(call add-http-link,"#","Code Composer Studio 6","Link to Code Compose=
r Studio 6 \(Coming Soon\)")
-	$(call add-http-link,"#","Download Pinmuxtool","AM437x Pin Mux Configur=
ation Utility  \(Coming Soon\)")
-	$(call add-divider,"AM437x SDK SD Card Creation")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_SDK_Creating_a_SD_Card_with_Windows","Windows SD Card Creation Wiki",=
"Instructions for creating an SD Card with Windows")
-	$(call add-link,"#","sitara_linux_sdk_am437x.img.zip","Only used when c=
reating an SD Card on Windows")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_SDK_Creating_a_SD_Card_with_Linux","Linux SD Card Creation Wiki","Ins=
tructions for creating an SD Card with Linux")
-	$(call add-divider,"AM437x SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"am437x-evm-sdk-src-07.00.00.00.tar.gz","am437x-evm-sdk=
-src-07.00.00.00.tar.gz", "AM437x SDK BSP Source Code")
-	$(call add-link,"am437x-evm-sdk-bin-07.00.00.00.tar.gz","am437x-evm-sdk=
-bin-07.00.00.00.tar.gz", "AM437x SDK prebuilt BSP binaries and root file=
system")
-	$(call add-divider,"AM437x SDK Documentation")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_SD=
K_Release_Notes","Sitara Linux SDK Release Notes","Link to Release Notes =
for Sitara Linux SDK")
-	$(call add-link,"am437x-evm-qsg.pdf","am437x-evm-qsg.pdf","AM437x EVM Q=
uick Start Guide")
-	$(call add-link,"sitara-linuxsdk-gsg-07.00.00.00.pdf", "sitara-linuxsdk=
-gsg-07.00.00.00.pdf", "Getting Started Guide")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_Software_Developer%E2%80%99s_Guide","Wiki version of Software Develop=
ers Guide","Link to the online Software Developers Guide which has the la=
test content")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"AM437x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/amsdk/07.01.00.00/am437x-evm/webgen.mak b/p=
ublish-sdk-data/amsdk/07.01.00.00/am437x-evm/webgen.mak
deleted file mode 100644
index ec08c75..0000000
--- a/publish-sdk-data/amsdk/07.01.00.00/am437x-evm/webgen.mak
+++ /dev/null
@@ -1,38 +0,0 @@
-PRODUCT_NAME=3DAM437xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM437xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3DThank you for your interest in the AM437x Software Devel=
opment Kit (SDK). This SDK supports the AM437x General Purpose EVM <a hre=
f=3D"www.ti.com/am437xevm">TMDXEVM437X</a>. If you would like to install =
the full SDK on a Linux Host computer for development, you=E2=80=99ll nee=
d the AM437x SDK Essentials below. If you would like to evaluate the SDK =
by running it on one of the above platforms and you prefer not to install=
 the full SDK at this time, please see the AM437x SDK SD Card Creation se=
ction below.<br><br>If you=E2=80=99d like more information on all of thes=
e choices, please refer to the Sitara Linux SDK Getting Started Guide (GS=
G) below or the latest version <a href=3D"http://processors.wiki.ti.com/i=
ndex.php/Sitara_Linux_SDK_Getting_Started_Guide">here</a>. For a complete=
 overview of the SDK, please refer to the Sitara Linux SDK Software Devlo=
per=E2=80=99s Guide (SDG) below or the latest version <a href=3D"http://p=
rocessors.wiki.ti.com/index.php/Sitara_Linux_Software_Developer%E2%
 80%99s_Guide">here</a>.
-
-VERSION=3D07.01.00.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM437x SDK Essentials")
-	$(call add-link,"ti-sdk-am437x-evm-07.01.00.00-Linux-x86-Install.bin","=
ti-sdk-am437x-evm-07.01.00.00-Linux-x86-Install.bin","AM437x EVM SDK \(32=
-bit Binary\)")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_SDK_64_Bit_Ubuntu_Support","Adding support for 64-bit Operating Syste=
ms","Instructions for users using a 64-bit version of Ubuntu")
-	$(call add-divider,"AM437x SDK Optional Addons")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Download_=
CCS#Code_Composer_Studio_Version_6_Downloads","Code Composer Studio 6","L=
ink to Code Composer Studio 6")
-	$(call add-http-link,"http://www.ti.com/tool/pinmuxtool","Download Pinm=
uxtool","AM437x Pin Mux Configuration Utility")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php?title=3DW=
L18xx_AMxxx_platform_integration_guide","Wilink 8 Addon Package","Wilink =
8 Addon Package")
-	$(call add-http-link,"#","PRU Addon Package","PRU Addon Package \(comin=
g soon\)")
-	$(call add-divider,"AM437x SDK SD Card Creation")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_SDK_Creating_a_SD_Card_with_Windows","Windows SD Card Creation Wiki",=
"Instructions for creating an SD Card with Windows")
-	$(call add-link,"#","sitara_linux_sdk_am437x.img.zip","Only used when c=
reating an SD Card on Windows")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_SDK_Creating_a_SD_Card_with_Linux","Linux SD Card Creation Wiki","Ins=
tructions for creating an SD Card with Linux")
-	$(call add-divider,"AM437x SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"am437x-evm-sdk-src-07.01.00.00.tar.gz","am437x-evm-sdk=
-src-07.01.00.00.tar.gz", "AM437x SDK BSP Source Code")
-	$(call add-link,"am437x-evm-sdk-bin-07.01.00.00.tar.gz","am437x-evm-sdk=
-bin-07.01.00.00.tar.gz", "AM437x SDK prebuilt BSP binaries and root file=
system")
-	$(call add-divider,"AM437x SDK Documentation")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_SD=
K_Release_Notes","Sitara Linux SDK Release Notes","Link to Release Notes =
for Sitara Linux SDK")
-	$(call add-link,"am437x-evm-qsg.pdf","am437x-evm-qsg.pdf","AM437x EVM Q=
uick Start Guide")
-	$(call add-link,"sitara-linuxsdk-gsg-07.01.00.00.pdf", "sitara-linuxsdk=
-gsg-07.01.00.00.pdf", "Getting Started Guide")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_Software_Developer%E2%80%99s_Guide","Wiki version of Software Develop=
ers Guide","Link to the online Software Developers Guide which has the la=
test content")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"AM437x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/amsdk/08.00.00.00/am335x-evm/webgen.mak b/p=
ublish-sdk-data/amsdk/08.00.00.00/am335x-evm/webgen.mak
deleted file mode 100644
index 56c0eb3..0000000
--- a/publish-sdk-data/amsdk/08.00.00.00/am335x-evm/webgen.mak
+++ /dev/null
@@ -1,39 +0,0 @@
-PRODUCT_NAME=3DAM335xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM335xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3DThank you for your interest in the AM335x Software Devel=
opment Kit (SDK). This SDK supports the  AM335x EVM <a href=3D"http://www=
.ti.com/tool/tmdxevm3358">TMDXEVM3358</a> and the AM335x StarterKit <a hr=
ef=3D"http://www.ti.com/tool/tmdssk3358">TMDSSK3358</a> from TI, as well =
as the very popular <a href=3D"http://beagleboard.org/Products/BeagleBone=
">Beaglebone</a> and <a href=3D"http://beagleboard.org/Products/BeagleBon=
e%20Black">Beaglebone Black</a> community boards. If you would like to in=
stall the full SDK on a Linux Host computer for development, you=E2=80=99=
ll need the AM335x SDK Essentials below. If you would like to evaluate th=
e SDK by running it on one of the above platforms and you prefer not to i=
nstall the full SDK at this time, please see the AM335x SDK SD Card Creat=
ion section below.<br><br>If you=E2=80=99d like more information on all o=
f these choices, please refer to the Sitara Linux SDK Getting Started Gui=
de (GSG) below or the latest version <a href=3D"http://processors
 .wiki.ti.com/index.php/Sitara_Linux_SDK_Getting_Started_Guide">here</a>.=
 For a complete overview of the SDK, please refer to the Sitara Linux SDK=
 Software Devloper=E2=80=99s Guide (SDG) below or the latest version <a h=
ref=3D"http://processors.wiki.ti.com/index.php/Sitara_Linux_Software_Deve=
loper%E2%80%99s_Guide">here</a>.
-
-VERSION=3D08.00.00.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-
-.prod_links:
-	$(call add-divider,"AM335x SDK Essentials")
-	$(call add-link,"ti-sdk-am335x-evm-08.00.00.00-Linux-x86-Install.bin","=
ti-sdk-am335x-evm-08.00.00.00-Linux-x86-Install.bin","AM335x EVM SDK \(32=
-bit Binary\)")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_SDK_64_Bit_Ubuntu_Support","Adding support for 64-bit Operating Syste=
ms","Instructions for users using a 64-bit version of Ubuntu")
-	$(call add-divider,"AM335x SDK Optional Addons")
-	$(call add-http-link,"#","Code Composer Studio 6","Link to Code Compose=
r Studio 6 \(Coming Soon\)")
-	$(call add-divider,"AM335x SDK SD Card Creation")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_SDK_Creating_a_SD_Card_with_Windows","Windows SD Card Creation Wiki",=
"Instructions for creating an SD Card with Windows")
-	$(call add-link,"sitara_linux_sdk_image_am335x.img.zip","sitara_linux_s=
dk_am335x.img.zip","Only used when creating an SD Card on Windows")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_SDK_Creating_a_SD_Card_with_Linux","Linux SD Card Creation Wiki","Ins=
tructions for creating an SD Card with Linux")
-	$(call add-divider,"AM335x SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"am335x-evm-sdk-src-08.00.00.00.tar.gz","am335x-evm-sdk=
-src-08.00.00.00.tar.gz", "AM335x SDK BSP Source Code")
-	$(call add-link,"am335x-evm-sdk-bin-08.00.00.00.tar.gz","am335x-evm-sdk=
-bin-08.00.00.00.tar.gz", "AM335x SDK prebuilt BSP binaries and root file=
system")
-	$(call add-divider,"AM335x SDK Documentation")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_SD=
K_Release_Notes","Sitara Linux SDK Release Notes","Link to Release Notes =
for Sitara Linux SDK")
-	$(call add-link,"am335x-evm-qsg.pdf","am335x-evm-qsg.pdf","AM335x EVM Q=
uick Start Guide")
-	$(call add-link,"am335x-evm-sk-qsg.pdf","am335x-evm-sk-qsg.pdf","AM335x=
 EVM-SK Quick Start Guide")
-	$(call add-link,"sitara-linuxsdk-gsg-08.00.00.00.pdf","sitara-linuxsdk-=
gsg-08.00.00.00.pdf", "Getting Started Guide")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_Software_Developer%E2%80%99s_Guide","Wiki version of Software Develop=
ers Guide","Link to the online Software Developers Guide which has the la=
test content")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"AM335x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
-	$(call add-divider,"Previous SDK Link")
-	$(call add-http-link,"http://software-dl.ti.com/sitara_linux/esd/AM335x=
SDK/07_00_00_00/index_FDS.html","AM335x v7.00 Download","Link to AM335x S=
DK 07.00.00.00 Download Page")
-
diff --git a/publish-sdk-data/amsdk/08.00.00.00/am437x-evm/webgen.mak b/p=
ublish-sdk-data/amsdk/08.00.00.00/am437x-evm/webgen.mak
deleted file mode 100644
index a4c25c7..0000000
--- a/publish-sdk-data/amsdk/08.00.00.00/am437x-evm/webgen.mak
+++ /dev/null
@@ -1,40 +0,0 @@
-PRODUCT_NAME=3DAM437xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM437xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3DThank you for your interest in the AM437x Software Devel=
opment Kit (SDK). This SDK supports the AM437x General Purpose EVM <a hre=
f=3D"www.ti.com/am437xevm">TMDXEVM437X</a>. If you would like to install =
the full SDK on a Linux Host computer for development, you=E2=80=99ll nee=
d the AM437x SDK Essentials below. If you would like to evaluate the SDK =
by running it on one of the above platforms and you prefer not to install=
 the full SDK at this time, please see the AM437x SDK SD Card Creation se=
ction below.<br><br>If you=E2=80=99d like more information on all of thes=
e choices, please refer to the Sitara Linux SDK Getting Started Guide (GS=
G) below or the latest version <a href=3D"http://processors.wiki.ti.com/i=
ndex.php/Sitara_Linux_SDK_Getting_Started_Guide">here</a>. For a complete=
 overview of the SDK, please refer to the Sitara Linux SDK Software Devlo=
per=E2=80=99s Guide (SDG) below or the latest version <a href=3D"http://p=
rocessors.wiki.ti.com/index.php/Sitara_Linux_Software_Developer%E2%
 80%99s_Guide">here</a>.
-
-VERSION=3D08.00.00.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM437x SDK Essentials")
-	$(call add-link,"ti-sdk-am437x-evm-08.00.00.00-Linux-x86-Install.bin","=
ti-sdk-am437x-evm-08.00.00.00-Linux-x86-Install.bin","AM437x EVM SDK \(32=
-bit Binary\)")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_SDK_64_Bit_Ubuntu_Support","Adding support for 64-bit Operating Syste=
ms","Instructions for users using a 64-bit version of Ubuntu")
-	$(call add-divider,"AM437x SDK Optional Addons")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Download_=
CCS#Code_Composer_Studio_Version_6_Downloads","Code Composer Studio 6","L=
ink to Code Composer Studio 6")
-	$(call add-http-link,"http://www.ti.com/tool/pinmuxtool","Download Pinm=
uxtool","AM437x Pin Mux Configuration Utility")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php?title=3DW=
L18xx_AMxxx_platform_integration_guide","Wilink 8 Addon Package","Wilink =
8 Addon Package")
-	$(call add-http-link,"#","PRU Addon Package","PRU Addon Package \(comin=
g soon\)")
-	$(call add-divider,"AM437x SDK SD Card Creation")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_SDK_Creating_a_SD_Card_with_Windows","Windows SD Card Creation Wiki",=
"Instructions for creating an SD Card with Windows")
-	$(call add-link,"#","sitara_linux_sdk_am437x.img.zip","Only used when c=
reating an SD Card on Windows")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_SDK_Creating_a_SD_Card_with_Linux","Linux SD Card Creation Wiki","Ins=
tructions for creating an SD Card with Linux")
-	$(call add-divider,"AM437x SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"am437x-evm-sdk-src-08.00.00.00.tar.gz","am437x-evm-sdk=
-src-08.00.00.00.tar.gz", "AM437x SDK BSP Source Code")
-	$(call add-link,"am437x-evm-sdk-bin-08.00.00.00.tar.gz","am437x-evm-sdk=
-bin-08.00.00.00.tar.gz", "AM437x SDK prebuilt BSP binaries and root file=
system")
-	$(call add-divider,"AM437x SDK Documentation")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_SD=
K_Release_Notes","Sitara Linux SDK Release Notes","Link to Release Notes =
for Sitara Linux SDK")
-	$(call add-link,"am437x-evm-qsg.pdf","am437x-evm-qsg.pdf","AM437x EVM Q=
uick Start Guide")
-	$(call add-link,"sitara-linuxsdk-gsg-08.00.00.00.pdf", "sitara-linuxsdk=
-gsg-08.00.00.00.pdf", "Getting Started Guide")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_Software_Developer%E2%80%99s_Guide","Wiki version of Software Develop=
ers Guide","Link to the online Software Developers Guide which has the la=
test content")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"AM437x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
-	$(call add-divider,"Previous SDK Link")
-	$(call add-http-link,"http://software-dl.ti.com/sitara_linux/esd/AM437x=
SDK/07_01_00_00/index_FDS.html","AM437x v7.01 Download","Link to AM437x S=
DK 07.01.00.00 Download Page")
diff --git a/publish-sdk-data/amsdk/08.00.00.00/am57xx-evm/webgen.mak b/p=
ublish-sdk-data/amsdk/08.00.00.00/am57xx-evm/webgen.mak
deleted file mode 100644
index dd37a56..0000000
--- a/publish-sdk-data/amsdk/08.00.00.00/am57xx-evm/webgen.mak
+++ /dev/null
@@ -1,38 +0,0 @@
-PRODUCT_NAME=3DAM57xxSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM57xxSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3DThank you for your interest in the AM57xxSDK Software De=
velopment Kit (SDK). This SDK supports the AM57xx General Purpose EVM <a =
href=3D"www.ti.com/am57xxevm">AM57xx EVM</a>. If you would like to instal=
l the full SDK on a Linux Host computer for development, you=E2=80=99ll n=
eed the AM57xx SDK Essentials below. If you would like to evaluate the SD=
K by running it on one of the above platforms and you prefer not to insta=
ll the full SDK at this time, please see the AM57xx SDK SD Card Creation =
section below.<br><br>If you=E2=80=99d like more information on all of th=
ese choices, please refer to the Sitara Linux SDK Getting Started Guide (=
GSG) below or the latest version <a href=3D"http://processors.wiki.ti.com=
/index.php/Sitara_Linux_SDK_Getting_Started_Guide">here</a>. For a comple=
te overview of the SDK, please refer to the Sitara Linux SDK Software Dev=
loper=E2=80=99s Guide (SDG) below or the latest version <a href=3D"http:/=
/processors.wiki.ti.com/index.php/Sitara_Linux_Software_Developer%E
 2%80%99s_Guide">here</a>.
-
-VERSION=3D08.00.00.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM57xx SDK Essentials")
-	$(call add-link,"ti-sdk-am57xx-evm-08.00.00.00-Linux-x86-Install.bin","=
ti-sdk-am57xx-evm-08.00.00.00-Linux-x86-Install.bin","AM57xx EVM SDK \(32=
-bit Binary\)")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_SDK_64_Bit_Ubuntu_Support","Adding support for 64-bit Operating Syste=
ms","Instructions for users using a 64-bit version of Ubuntu")
-	$(call add-divider,"AM57xx SDK Optional Addons")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Download_=
CCS#Code_Composer_Studio_Version_6_Downloads","Code Composer Studio 6","L=
ink to Code Composer Studio 6")
-	$(call add-http-link,"http://www.ti.com/tool/pinmuxtool","Download Pinm=
uxtool","AM57xx Pin Mux Configuration Utility")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php?title=3DW=
L18xx_AMxxx_platform_integration_guide","Wilink 8 Addon Package","Wilink =
8 Addon Package")
-	$(call add-http-link,"#","PRU Addon Package","PRU Addon Package \(comin=
g soon\)")
-	$(call add-divider,"AM57xx SDK SD Card Creation")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_SDK_Creating_a_SD_Card_with_Windows","Windows SD Card Creation Wiki",=
"Instructions for creating an SD Card with Windows")
-	$(call add-link,"#","sitara_linux_sdk_am57xx.img.zip","Only used when c=
reating an SD Card on Windows")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_SDK_Creating_a_SD_Card_with_Linux","Linux SD Card Creation Wiki","Ins=
tructions for creating an SD Card with Linux")
-	$(call add-divider,"AM57xx SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"am57xx-evm-sdk-src-08.00.00.00.tar.gz","am57xx-evm-sdk=
-src-08.00.00.00.tar.gz", "AM57xx SDK BSP Source Code")
-	$(call add-link,"am57xx-evm-sdk-bin-08.00.00.00.tar.gz","am57xx-evm-sdk=
-bin-08.00.00.00.tar.gz", "AM57xx SDK prebuilt BSP binaries and root file=
system")
-	$(call add-divider,"AM57xx SDK Documentation")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_SD=
K_Release_Notes","Sitara Linux SDK Release Notes","Link to Release Notes =
for Sitara Linux SDK")
-	$(call add-link,"am57xx-evm-qsg.pdf","am57xx-evm-qsg.pdf","AM57xx EVM Q=
uick Start Guide")
-	$(call add-link,"sitara-linuxsdk-gsg-08.00.00.00.pdf", "sitara-linuxsdk=
-gsg-08.00.00.00.pdf", "Getting Started Guide")
-	$(call add-http-link,"http://processors.wiki.ti.com/index.php/Sitara_Li=
nux_Software_Developer%E2%80%99s_Guide","Wiki version of Software Develop=
ers Guide","Link to the online Software Developers Guide which has the la=
test content")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"AM57xx SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2013.04.00/am335x-evm/webgen.mak b/=
publish-sdk-data/coresdk/2013.04.00/am335x-evm/webgen.mak
deleted file mode 100644
index 7aca575..0000000
--- a/publish-sdk-data/coresdk/2013.04.00/am335x-evm/webgen.mak
+++ /dev/null
@@ -1,29 +0,0 @@
-PRODUCT_NAME=3DAM335xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM335xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the AM335x Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2013.04.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM335x SDK Essentials")
-	$(call add-link,"ti-sdk-am335x-evm-2013.04.00-Linux-x86-Install.bin","t=
i-sdk-am335x-evm-2013.04.00-Linux-x86-Install.bin","AM335x EVM SDK")
-	$(call add-divider,"AM335x SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM335x SDK Individual Components")
-	$(call add-link,"am335x-evm-qsg.pdf","am335x-evm-qsg.pdf","AM335x EVM Q=
uick Start Guide")
-	$(call add-link,"am335x-evm-sk-qsg.pdf","am335x-evm-sk-qsg.pdf","AM335x=
 EVM-SK Quick Start Guide")
-	$(call add-link,"beaglebone-qsg.pdf","beaglebone-qsg.pdf","BeagleBone Q=
uick Start Guide")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-link,"am335x-evm-sdk-src-2013.04.00.tar.gz","am335x-evm-sdk-=
src-2013.04.00.tar.gz", "AM335x SDK PSP Source Code")
-	$(call add-link,"am335x-evm-sdk-bin-2013.04.00.tar.gz","am335x-evm-sdk-=
bin-2013.04.00.tar.gz", "AM335x SDK prebuilt PSP binaries and root filesy=
stem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"AM335x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2013.04.00/dra7xx-evm/webgen.mak b/=
publish-sdk-data/coresdk/2013.04.00/dra7xx-evm/webgen.mak
deleted file mode 100644
index fc07a91..0000000
--- a/publish-sdk-data/coresdk/2013.04.00/dra7xx-evm/webgen.mak
+++ /dev/null
@@ -1,27 +0,0 @@
-PRODUCT_NAME=3DDRA7xxSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DDRA7xxSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the DRA7xx Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2013.04.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"DRA7xx SDK Essentials")
-	$(call add-link,"ti-sdk-dra7xx-evm-2013.04.00-Linux-x86-Install.bin","t=
i-sdk-dra7xx-evm-2013.04.00-Linux-x86-Install.bin","DRA7xx EVM SDK")
-	$(call add-divider,"DRA7xx SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS b=
undle can be used for ARM debuggin on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"DRA7xx SDK Individual Components")
-	$(call add-link,"dra7xx-evm-qsg.pdf","dra7xx-evm-qsg.pdf","DRA7xx EVM Q=
uick Start Guide")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-link,"dra7xx-evm-sdk-src-2013.04.00.tar.gz","dra7xx-evm-sdk-=
src-2013.04.00.tar.gz", "DRA7xx SDK PSP Source Code")
-	$(call add-link,"dra7xx-evm-sdk-bin-2013.04.00.tar.gz","dra7xx-evm-sdk-=
bin-2013.04.00.tar.gz", "DRA7xx SDK prebuilt PSP binaries and root filesy=
stem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"DRA7xx SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2013.04.00/omap5-evm/webgen.mak b/p=
ublish-sdk-data/coresdk/2013.04.00/omap5-evm/webgen.mak
deleted file mode 100644
index 8ab923e..0000000
--- a/publish-sdk-data/coresdk/2013.04.00/omap5-evm/webgen.mak
+++ /dev/null
@@ -1,26 +0,0 @@
-PRODUCT_NAME=3DOMAP5SDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DOMAP5SDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the OMAP5 Core SDK from the LCPD =
team.  It is intended as a reference for INTERNAL use only and should not=
 be distributed to customers.<br>
-
-VERSION=3D2013.04.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"OMAP5 SDK Essentials")
-	$(call add-link,"ti-sdk-omap5-evm-2013.04.00-Linux-x86-Install.bin","ti=
-sdk-omap5-evm-2013.04.00-Linux-x86-Install.bin","OMAP5 EVM SDK")
-	$(call add-divider,"OMAP5 SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS b=
undle can be used for ARM debuggin on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"OMAP5 SDK Individual Components")
-	$(call add-link,"omap5-evm-qsg.pdf","omap5-evm-qsg.pdf","OMAP5 EVM Quic=
k Start Guide")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-link,"omap5-evm-sdk-src-2013.04.00.tar.gz","omap5-evm-sdk-sr=
c-2013.04.00.tar.gz", "OMAP5 SDK PSP Source Code")
-	$(call add-link,"omap5-evm-sdk-bin-2013.04.00.tar.gz","omap5-evm-sdk-bi=
n-2013.04.00.tar.gz", "OMAP5 SDK prebuilt PSP binaries and root filesyste=
m")
-	$(call add-divider,"OMAP5 SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2013.04.01/am335x-evm/webgen.mak b/=
publish-sdk-data/coresdk/2013.04.01/am335x-evm/webgen.mak
deleted file mode 100644
index 0e7c975..0000000
--- a/publish-sdk-data/coresdk/2013.04.01/am335x-evm/webgen.mak
+++ /dev/null
@@ -1,29 +0,0 @@
-PRODUCT_NAME=3DAM335xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM335xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the AM335x Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2013.04.01
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM335x SDK Essentials")
-	$(call add-link,"ti-sdk-am335x-evm-2013.04.01-Linux-x86-Install.bin","t=
i-sdk-am335x-evm-2013.04.01-Linux-x86-Install.bin","AM335x EVM SDK")
-	$(call add-divider,"AM335x SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM335x SDK Individual Components")
-	$(call add-link,"am335x-evm-qsg.pdf","am335x-evm-qsg.pdf","AM335x EVM Q=
uick Start Guide")
-	$(call add-link,"am335x-evm-sk-qsg.pdf","am335x-evm-sk-qsg.pdf","AM335x=
 EVM-SK Quick Start Guide")
-	$(call add-link,"beaglebone-qsg.pdf","beaglebone-qsg.pdf","BeagleBone Q=
uick Start Guide")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-link,"am335x-evm-sdk-src-2013.04.01.tar.gz","am335x-evm-sdk-=
src-2013.04.01.tar.gz", "AM335x SDK PSP Source Code")
-	$(call add-link,"am335x-evm-sdk-bin-2013.04.01.tar.gz","am335x-evm-sdk-=
bin-2013.04.01.tar.gz", "AM335x SDK prebuilt PSP binaries and root filesy=
stem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"AM335x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2013.04.02/dra7xx-evm/webgen.mak b/=
publish-sdk-data/coresdk/2013.04.02/dra7xx-evm/webgen.mak
deleted file mode 100644
index 3f944b2..0000000
--- a/publish-sdk-data/coresdk/2013.04.02/dra7xx-evm/webgen.mak
+++ /dev/null
@@ -1,27 +0,0 @@
-PRODUCT_NAME=3DDRA7xxSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DDRA7xxSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the DRA7xx Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2013.04.02
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"DRA7xx SDK Essentials")
-	$(call add-link,"ti-sdk-dra7xx-evm-2013.04.02-Linux-x86-Install.bin","t=
i-sdk-dra7xx-evm-2013.04.02-Linux-x86-Install.bin","DRA7xx EVM SDK")
-	$(call add-divider,"DRA7xx SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS b=
undle can be used for ARM debuggin on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"DRA7xx SDK Individual Components")
-	$(call add-link,"dra7xx-evm-qsg.pdf","dra7xx-evm-qsg.pdf","DRA7xx EVM Q=
uick Start Guide")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-link,"dra7xx-evm-sdk-src-2013.04.02.tar.gz","dra7xx-evm-sdk-=
src-2013.04.02.tar.gz", "DRA7xx SDK PSP Source Code")
-	$(call add-link,"dra7xx-evm-sdk-bin-2013.04.02.tar.gz","dra7xx-evm-sdk-=
bin-2013.04.02.tar.gz", "DRA7xx SDK prebuilt PSP binaries and root filesy=
stem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"DRA7xx SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2013.04.02/omap5-evm/webgen.mak b/p=
ublish-sdk-data/coresdk/2013.04.02/omap5-evm/webgen.mak
deleted file mode 100644
index dc8ec18..0000000
--- a/publish-sdk-data/coresdk/2013.04.02/omap5-evm/webgen.mak
+++ /dev/null
@@ -1,26 +0,0 @@
-PRODUCT_NAME=3DOMAP5SDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DOMAP5SDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the OMAP5 Core SDK from the LCPD =
team.  It is intended as a reference for INTERNAL use only and should not=
 be distributed to customers.<br>
-
-VERSION=3D2013.04.02
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"OMAP5 SDK Essentials")
-	$(call add-link,"ti-sdk-omap5-evm-2013.04.02-Linux-x86-Install.bin","ti=
-sdk-omap5-evm-2013.04.02-Linux-x86-Install.bin","OMAP5 EVM SDK")
-	$(call add-divider,"OMAP5 SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS b=
undle can be used for ARM debuggin on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"OMAP5 SDK Individual Components")
-	$(call add-link,"omap5-evm-qsg.pdf","omap5-evm-qsg.pdf","OMAP5 EVM Quic=
k Start Guide")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-link,"omap5-evm-sdk-src-2013.04.02.tar.gz","omap5-evm-sdk-sr=
c-2013.04.02.tar.gz", "OMAP5 SDK PSP Source Code")
-	$(call add-link,"omap5-evm-sdk-bin-2013.04.02.tar.gz","omap5-evm-sdk-bi=
n-2013.04.02.tar.gz", "OMAP5 SDK prebuilt PSP binaries and root filesyste=
m")
-	$(call add-divider,"OMAP5 SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2013.10.00/am335x-evm/webgen.mak b/=
publish-sdk-data/coresdk/2013.10.00/am335x-evm/webgen.mak
deleted file mode 100644
index 8b53ec7..0000000
--- a/publish-sdk-data/coresdk/2013.10.00/am335x-evm/webgen.mak
+++ /dev/null
@@ -1,29 +0,0 @@
-PRODUCT_NAME=3DAM335xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM335xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the AM335x Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2013.10.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM335x SDK Essentials")
-	$(call add-link,"ti-sdk-am335x-evm-2013.10.00-Linux-x86-Install.bin","t=
i-sdk-am335x-evm-2013.10.00-Linux-x86-Install.bin","AM335x EVM SDK")
-	$(call add-divider,"AM335x SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS b=
undle can be used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM335x SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"am335x-evm-sdk-src-2013.10.00.tar.gz","am335x-evm-sdk-=
src-2013.10.00.tar.gz", "AM335x SDK PSP Source Code")
-	$(call add-link,"am335x-evm-sdk-bin-2013.10.00.tar.gz","am335x-evm-sdk-=
bin-2013.10.00.tar.gz", "AM335x SDK prebuilt PSP binaries and root filesy=
stem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"AM335x SDK Documentation")
-	$(call add-link,"am335x-evm-qsg.pdf","am335x-evm-qsg.pdf","AM335x EVM Q=
uick Start Guide")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"AM335x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2013.10.00/am437x-evm/webgen.mak b/=
publish-sdk-data/coresdk/2013.10.00/am437x-evm/webgen.mak
deleted file mode 100644
index d15a602..0000000
--- a/publish-sdk-data/coresdk/2013.10.00/am437x-evm/webgen.mak
+++ /dev/null
@@ -1,29 +0,0 @@
-PRODUCT_NAME=3DAM437xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM437xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the AM437x Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2013.10.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM437x SDK Essentials")
-	$(call add-link,"ti-sdk-am437x-evm-2013.10.00-Linux-x86-Install.bin","t=
i-sdk-am437x-evm-2013.10.00-Linux-x86-Install.bin","AM437x EVM SDK")
-	$(call add-divider,"AM437x SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS b=
undle can be used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM437x SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"am437x-evm-sdk-src-2013.10.00.tar.gz","am437x-evm-sdk-=
src-2013.10.00.tar.gz", "AM437x SDK PSP Source Code")
-	$(call add-link,"am437x-evm-sdk-bin-2013.10.00.tar.gz","am437x-evm-sdk-=
bin-2013.10.00.tar.gz", "AM437x SDK prebuilt PSP binaries and root filesy=
stem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"AM437x SDK Documentation")
-	$(call add-link,"am437x-evm-qsg.pdf","am437x-evm-qsg.pdf","AM437x EVM Q=
uick Start Guide")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"AM437x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2013.10.00/dra7xx-evm/webgen.mak b/=
publish-sdk-data/coresdk/2013.10.00/dra7xx-evm/webgen.mak
deleted file mode 100644
index a1e82e1..0000000
--- a/publish-sdk-data/coresdk/2013.10.00/dra7xx-evm/webgen.mak
+++ /dev/null
@@ -1,29 +0,0 @@
-PRODUCT_NAME=3DDRA7xxSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DDRA7xxSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the DRA7xx Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2013.10.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"DRA7xx SDK Essentials")
-	$(call add-link,"ti-sdk-dra7xx-evm-2013.10.00-Linux-x86-Install.bin","t=
i-sdk-dra7xx-evm-2013.10.00-Linux-x86-Install.bin","DRA7xx EVM SDK")
-	$(call add-divider,"DRA7xx SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS b=
undle can be used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"DRA7xx SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"dra7xx-evm-sdk-src-2013.10.00.tar.gz","dra7xx-evm-sdk-=
src-2013.10.00.tar.gz", "DRA7xx SDK PSP Source Code")
-	$(call add-link,"dra7xx-evm-sdk-bin-2013.10.00.tar.gz","dra7xx-evm-sdk-=
bin-2013.10.00.tar.gz", "DRA7xx SDK prebuilt PSP binaries and root filesy=
stem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"DRA7xx SDK Documentation")
-	$(call add-link,"dra7xx-evm-qsg.pdf","dra7xx-evm-qsg.pdf","DRA7xx EVM Q=
uick Start Guide")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"DRA7xx SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2013.10.00/omap5-evm/webgen.mak b/p=
ublish-sdk-data/coresdk/2013.10.00/omap5-evm/webgen.mak
deleted file mode 100644
index 15e74d1..0000000
--- a/publish-sdk-data/coresdk/2013.10.00/omap5-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DOMAP5SDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DOMAP5SDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the OMAP5 Core SDK from the LCPD =
team.  It is intended as a reference for INTERNAL use only and should not=
 be distributed to customers.<br>
-
-VERSION=3D2013.10.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"OMAP5 SDK Essentials")
-	$(call add-link,"ti-sdk-omap5-evm-2013.10.00-Linux-x86-Install.bin","ti=
-sdk-omap5-evm-2013.10.00-Linux-x86-Install.bin","OMAP5 EVM SDK")
-	$(call add-divider,"OMAP5 SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS b=
undle can be used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"OMAP5 SDK Individual Components \(all of the below =
compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"omap5-evm-sdk-src-2013.10.00.tar.gz","omap5-evm-sdk-sr=
c-2013.10.00.tar.gz", "OMAP5 SDK PSP Source Code")
-	$(call add-link,"omap5-evm-sdk-bin-2013.10.00.tar.gz","omap5-evm-sdk-bi=
n-2013.10.00.tar.gz", "OMAP5 SDK prebuilt PSP binaries and root filesyste=
m")
-	$(call add-divider,"OMAP5 SDK Documentation")
-	$(call add-link,"omap5-evm-qsg.pdf","omap5-evm-qsg.pdf","OMAP5 EVM Quic=
k Start Guide")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"OMAP5 SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2013.12.00/am335x-evm/webgen.mak b/=
publish-sdk-data/coresdk/2013.12.00/am335x-evm/webgen.mak
deleted file mode 100644
index 52e974f..0000000
--- a/publish-sdk-data/coresdk/2013.12.00/am335x-evm/webgen.mak
+++ /dev/null
@@ -1,29 +0,0 @@
-PRODUCT_NAME=3DAM335xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM335xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the AM335x Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2013.12.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM335x SDK Essentials")
-	$(call add-link,"ti-sdk-am335x-evm-2013.12.00-Linux-x86-Install.bin","t=
i-sdk-am335x-evm-2013.12.00-Linux-x86-Install.bin","AM335x EVM SDK")
-	$(call add-divider,"AM335x SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS b=
undle can be used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM335x SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"am335x-evm-sdk-src-2013.12.00.tar.gz","am335x-evm-sdk-=
src-2013.12.00.tar.gz", "AM335x SDK PSP Source Code")
-	$(call add-link,"am335x-evm-sdk-bin-2013.12.00.tar.gz","am335x-evm-sdk-=
bin-2013.12.00.tar.gz", "AM335x SDK prebuilt PSP binaries and root filesy=
stem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"AM335x SDK Documentation")
-	$(call add-link,"am335x-evm-qsg.pdf","am335x-evm-qsg.pdf","AM335x EVM Q=
uick Start Guide")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"AM335x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2013.12.00/am437x-evm/webgen.mak b/=
publish-sdk-data/coresdk/2013.12.00/am437x-evm/webgen.mak
deleted file mode 100644
index b9fda2b..0000000
--- a/publish-sdk-data/coresdk/2013.12.00/am437x-evm/webgen.mak
+++ /dev/null
@@ -1,29 +0,0 @@
-PRODUCT_NAME=3DAM437xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM437xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the AM437x Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2013.12.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM437x SDK Essentials")
-	$(call add-link,"ti-sdk-am437x-evm-2013.12.00-Linux-x86-Install.bin","t=
i-sdk-am437x-evm-2013.12.00-Linux-x86-Install.bin","AM437x EVM SDK")
-	$(call add-divider,"AM437x SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS b=
undle can be used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM437x SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"am437x-evm-sdk-src-2013.12.00.tar.gz","am437x-evm-sdk-=
src-2013.12.00.tar.gz", "AM437x SDK PSP Source Code")
-	$(call add-link,"am437x-evm-sdk-bin-2013.12.00.tar.gz","am437x-evm-sdk-=
bin-2013.12.00.tar.gz", "AM437x SDK prebuilt PSP binaries and root filesy=
stem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"AM437x SDK Documentation")
-	$(call add-link,"am437x-evm-qsg.pdf","am437x-evm-qsg.pdf","AM437x EVM Q=
uick Start Guide")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"AM437x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2013.12.00/dra7xx-evm/webgen.mak b/=
publish-sdk-data/coresdk/2013.12.00/dra7xx-evm/webgen.mak
deleted file mode 100644
index 0b8d257..0000000
--- a/publish-sdk-data/coresdk/2013.12.00/dra7xx-evm/webgen.mak
+++ /dev/null
@@ -1,29 +0,0 @@
-PRODUCT_NAME=3DDRA7xxSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DDRA7xxSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the DRA7xx Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2013.12.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"DRA7xx SDK Essentials")
-	$(call add-link,"ti-sdk-dra7xx-evm-2013.12.00-Linux-x86-Install.bin","t=
i-sdk-dra7xx-evm-2013.12.00-Linux-x86-Install.bin","DRA7xx EVM SDK")
-	$(call add-divider,"DRA7xx SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS b=
undle can be used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"DRA7xx SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"dra7xx-evm-sdk-src-2013.12.00.tar.gz","dra7xx-evm-sdk-=
src-2013.12.00.tar.gz", "DRA7xx SDK PSP Source Code")
-	$(call add-link,"dra7xx-evm-sdk-bin-2013.12.00.tar.gz","dra7xx-evm-sdk-=
bin-2013.12.00.tar.gz", "DRA7xx SDK prebuilt PSP binaries and root filesy=
stem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"DRA7xx SDK Documentation")
-	$(call add-link,"dra7xx-evm-qsg.pdf","dra7xx-evm-qsg.pdf","DRA7xx EVM Q=
uick Start Guide")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"DRA7xx SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2013.12.00/omap5-evm/webgen.mak b/p=
ublish-sdk-data/coresdk/2013.12.00/omap5-evm/webgen.mak
deleted file mode 100644
index 1ca4ad8..0000000
--- a/publish-sdk-data/coresdk/2013.12.00/omap5-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DOMAP5SDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DOMAP5SDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the OMAP5 Core SDK from the LCPD =
team.  It is intended as a reference for INTERNAL use only and should not=
 be distributed to customers.<br>
-
-VERSION=3D2013.12.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"OMAP5 SDK Essentials")
-	$(call add-link,"ti-sdk-omap5-evm-2013.12.00-Linux-x86-Install.bin","ti=
-sdk-omap5-evm-2013.12.00-Linux-x86-Install.bin","OMAP5 EVM SDK")
-	$(call add-divider,"OMAP5 SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS b=
undle can be used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"OMAP5 SDK Individual Components \(all of the below =
compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"omap5-evm-sdk-src-2013.12.00.tar.gz","omap5-evm-sdk-sr=
c-2013.12.00.tar.gz", "OMAP5 SDK PSP Source Code")
-	$(call add-link,"omap5-evm-sdk-bin-2013.12.00.tar.gz","omap5-evm-sdk-bi=
n-2013.12.00.tar.gz", "OMAP5 SDK prebuilt PSP binaries and root filesyste=
m")
-	$(call add-divider,"OMAP5 SDK Documentation")
-	$(call add-link,"omap5-evm-qsg.pdf","omap5-evm-qsg.pdf","OMAP5 EVM Quic=
k Start Guide")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"OMAP5 SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2013.12.01/am335x-evm/webgen.mak b/=
publish-sdk-data/coresdk/2013.12.01/am335x-evm/webgen.mak
deleted file mode 100644
index 51e4396..0000000
--- a/publish-sdk-data/coresdk/2013.12.01/am335x-evm/webgen.mak
+++ /dev/null
@@ -1,29 +0,0 @@
-PRODUCT_NAME=3DAM335xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM335xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the AM335x Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2013.12.01
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM335x SDK Essentials")
-	$(call add-link,"ti-sdk-am335x-evm-2013.12.01-Linux-x86-Install.bin","t=
i-sdk-am335x-evm-2013.12.01-Linux-x86-Install.bin","AM335x EVM SDK")
-	$(call add-divider,"AM335x SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS b=
undle can be used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM335x SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"am335x-evm-sdk-src-2013.12.01.tar.gz","am335x-evm-sdk-=
src-2013.12.01.tar.gz", "AM335x SDK PSP Source Code")
-	$(call add-link,"am335x-evm-sdk-bin-2013.12.01.tar.gz","am335x-evm-sdk-=
bin-2013.12.01.tar.gz", "AM335x SDK prebuilt PSP binaries and root filesy=
stem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"AM335x SDK Documentation")
-	$(call add-link,"am335x-evm-qsg.pdf","am335x-evm-qsg.pdf","AM335x EVM Q=
uick Start Guide")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"AM335x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2013.12.01/am437x-evm/webgen.mak b/=
publish-sdk-data/coresdk/2013.12.01/am437x-evm/webgen.mak
deleted file mode 100644
index ac5d395..0000000
--- a/publish-sdk-data/coresdk/2013.12.01/am437x-evm/webgen.mak
+++ /dev/null
@@ -1,29 +0,0 @@
-PRODUCT_NAME=3DAM437xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM437xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the AM437x Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2013.12.01
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM437x SDK Essentials")
-	$(call add-link,"ti-sdk-am437x-evm-2013.12.01-Linux-x86-Install.bin","t=
i-sdk-am437x-evm-2013.12.01-Linux-x86-Install.bin","AM437x EVM SDK")
-	$(call add-divider,"AM437x SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS b=
undle can be used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM437x SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"am437x-evm-sdk-src-2013.12.01.tar.gz","am437x-evm-sdk-=
src-2013.12.01.tar.gz", "AM437x SDK PSP Source Code")
-	$(call add-link,"am437x-evm-sdk-bin-2013.12.01.tar.gz","am437x-evm-sdk-=
bin-2013.12.01.tar.gz", "AM437x SDK prebuilt PSP binaries and root filesy=
stem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"AM437x SDK Documentation")
-	$(call add-link,"am437x-evm-qsg.pdf","am437x-evm-qsg.pdf","AM437x EVM Q=
uick Start Guide")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"AM437x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2013.12.01/dra7xx-evm/webgen.mak b/=
publish-sdk-data/coresdk/2013.12.01/dra7xx-evm/webgen.mak
deleted file mode 100644
index 90ee6ea..0000000
--- a/publish-sdk-data/coresdk/2013.12.01/dra7xx-evm/webgen.mak
+++ /dev/null
@@ -1,29 +0,0 @@
-PRODUCT_NAME=3DDRA7xxSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DDRA7xxSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the DRA7xx Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2013.12.01
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"DRA7xx SDK Essentials")
-	$(call add-link,"ti-sdk-dra7xx-evm-2013.12.01-Linux-x86-Install.bin","t=
i-sdk-dra7xx-evm-2013.12.01-Linux-x86-Install.bin","DRA7xx EVM SDK")
-	$(call add-divider,"DRA7xx SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS b=
undle can be used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"DRA7xx SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"dra7xx-evm-sdk-src-2013.12.01.tar.gz","dra7xx-evm-sdk-=
src-2013.12.01.tar.gz", "DRA7xx SDK PSP Source Code")
-	$(call add-link,"dra7xx-evm-sdk-bin-2013.12.01.tar.gz","dra7xx-evm-sdk-=
bin-2013.12.01.tar.gz", "DRA7xx SDK prebuilt PSP binaries and root filesy=
stem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"DRA7xx SDK Documentation")
-	$(call add-link,"dra7xx-evm-qsg.pdf","dra7xx-evm-qsg.pdf","DRA7xx EVM Q=
uick Start Guide")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"DRA7xx SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2013.12.01/omap5-evm/webgen.mak b/p=
ublish-sdk-data/coresdk/2013.12.01/omap5-evm/webgen.mak
deleted file mode 100644
index d9898a4..0000000
--- a/publish-sdk-data/coresdk/2013.12.01/omap5-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DOMAP5SDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DOMAP5SDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the OMAP5 Core SDK from the LCPD =
team.  It is intended as a reference for INTERNAL use only and should not=
 be distributed to customers.<br>
-
-VERSION=3D2013.12.01
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"OMAP5 SDK Essentials")
-	$(call add-link,"ti-sdk-omap5-evm-2013.12.01-Linux-x86-Install.bin","ti=
-sdk-omap5-evm-2013.12.01-Linux-x86-Install.bin","OMAP5 EVM SDK")
-	$(call add-divider,"OMAP5 SDK Optional Addons")
-	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.=
00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS b=
undle can be used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"OMAP5 SDK Individual Components \(all of the below =
compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"omap5-evm-sdk-src-2013.12.01.tar.gz","omap5-evm-sdk-sr=
c-2013.12.01.tar.gz", "OMAP5 SDK PSP Source Code")
-	$(call add-link,"omap5-evm-sdk-bin-2013.12.01.tar.gz","omap5-evm-sdk-bi=
n-2013.12.01.tar.gz", "OMAP5 SDK prebuilt PSP binaries and root filesyste=
m")
-	$(call add-divider,"OMAP5 SDK Documentation")
-	$(call add-link,"omap5-evm-qsg.pdf","omap5-evm-qsg.pdf","OMAP5 EVM Quic=
k Start Guide")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"OMAP5 SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2014.08.00/am335x-evm/webgen.mak b/=
publish-sdk-data/coresdk/2014.08.00/am335x-evm/webgen.mak
deleted file mode 100644
index 7a5aa77..0000000
--- a/publish-sdk-data/coresdk/2014.08.00/am335x-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DAM335xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM335xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the AM335x Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2014.08.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM335x SDK Essentials")
-	$(call add-link,"ti-sdk-am335x-evm-2014.08.00-Linux-x86-Install.bin","t=
i-sdk-am335x-evm-2014.08.00-Linux-x86-Install.bin","AM335x EVM SDK")
-	$(call add-divider,"AM335x SDK Optional Addons")
-	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_l=
inux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be=
 used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM335x SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"am335x-evm-sdk-src-2014.08.00.tar.gz","am335x-evm-sdk-=
src-2014.08.00.tar.gz", "AM335x SDK PSP Source Code")
-	$(call add-link,"am335x-evm-sdk-bin-2014.08.00.tar.gz","am335x-evm-sdk-=
bin-2014.08.00.tar.gz", "AM335x SDK prebuilt PSP binaries and root filesy=
stem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"AM335x SDK Documentation")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"AM335x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2014.08.00/am437x-evm/webgen.mak b/=
publish-sdk-data/coresdk/2014.08.00/am437x-evm/webgen.mak
deleted file mode 100644
index e9d2e5b..0000000
--- a/publish-sdk-data/coresdk/2014.08.00/am437x-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DAM437xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM437xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the AM437x Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2014.08.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM437x SDK Essentials")
-	$(call add-link,"ti-sdk-am437x-evm-2014.08.00-Linux-x86-Install.bin","t=
i-sdk-am437x-evm-2014.08.00-Linux-x86-Install.bin","AM437x EVM SDK")
-	$(call add-divider,"AM437x SDK Optional Addons")
-	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_l=
inux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be=
 used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM437x SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"am437x-evm-sdk-src-2014.08.00.tar.gz","am437x-evm-sdk-=
src-2014.08.00.tar.gz", "AM437x SDK PSP Source Code")
-	$(call add-link,"am437x-evm-sdk-bin-2014.08.00.tar.gz","am437x-evm-sdk-=
bin-2014.08.00.tar.gz", "AM437x SDK prebuilt PSP binaries and root filesy=
stem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"AM437x SDK Documentation")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"AM437x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2014.08.00/am57xx-evm/webgen.mak b/=
publish-sdk-data/coresdk/2014.08.00/am57xx-evm/webgen.mak
deleted file mode 100644
index 8d76d25..0000000
--- a/publish-sdk-data/coresdk/2014.08.00/am57xx-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DAM57xxSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM57xxSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the AM57xx Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2014.08.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM57xx SDK Essentials")
-	$(call add-link,"ti-sdk-am57xx-evm-2014.08.00-Linux-x86-Install.bin","t=
i-sdk-am57xx-evm-2014.08.00-Linux-x86-Install.bin","AM57xx EVM SDK")
-	$(call add-divider,"AM57xx SDK Optional Addons")
-	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_l=
inux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be=
 used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM57xx SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"am57xx-evm-sdk-src-2014.08.00.tar.gz","am57xx-evm-sdk-=
src-2014.08.00.tar.gz", "AM57xx SDK PSP Source Code")
-	$(call add-link,"am57xx-evm-sdk-bin-2014.08.00.tar.gz","am57xx-evm-sdk-=
bin-2014.08.00.tar.gz", "AM57xx SDK prebuilt PSP binaries and root filesy=
stem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"AM57xx SDK Documentation")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"AM57xx SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2014.08.00/dra7xx-evm/webgen.mak b/=
publish-sdk-data/coresdk/2014.08.00/dra7xx-evm/webgen.mak
deleted file mode 100644
index ac7ea1a..0000000
--- a/publish-sdk-data/coresdk/2014.08.00/dra7xx-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DDRA7xxSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DDRA7xxSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the DRA7xx Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2014.08.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"DRA7xx SDK Essentials")
-	$(call add-link,"ti-sdk-dra7xx-evm-2014.08.00-Linux-x86-Install.bin","t=
i-sdk-dra7xx-evm-2014.08.00-Linux-x86-Install.bin","DRA7xx EVM SDK")
-	$(call add-divider,"DRA7xx SDK Optional Addons")
-	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_l=
inux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be=
 used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"DRA7xx SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"dra7xx-evm-sdk-src-2014.08.00.tar.gz","dra7xx-evm-sdk-=
src-2014.08.00.tar.gz", "DRA7xx SDK PSP Source Code")
-	$(call add-link,"dra7xx-evm-sdk-bin-2014.08.00.tar.gz","dra7xx-evm-sdk-=
bin-2014.08.00.tar.gz", "DRA7xx SDK prebuilt PSP binaries and root filesy=
stem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"DRA7xx SDK Documentation")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"DRA7xx SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2014.08.00/k2hk-evm/webgen.mak b/pu=
blish-sdk-data/coresdk/2014.08.00/k2hk-evm/webgen.mak
deleted file mode 100644
index 04be12d..0000000
--- a/publish-sdk-data/coresdk/2014.08.00/k2hk-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DK2HKSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DK2HKSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the K2HK Core SDK from the LCPD t=
eam.  It is intended as a reference for INTERNAL use only and should not =
be distributed to customers.<br>
-
-VERSION=3D2014.08.00
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"K2HK SDK Essentials")
-	$(call add-link,"ti-sdk-k2hk-evm-2014.08.00-Linux-x86-Install.bin","ti-=
sdk-k2hk-evm-2014.08.00-Linux-x86-Install.bin","K2HK EVM SDK")
-	$(call add-divider,"K2HK SDK Optional Addons")
-	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_l=
inux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be=
 used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"K2HK SDK Individual Components \(all of the below c=
ompoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"k2hk-evm-sdk-src-2014.08.00.tar.gz","k2hk-evm-sdk-src-=
2014.08.00.tar.gz", "K2HK SDK PSP Source Code")
-	$(call add-link,"k2hk-evm-sdk-bin-2014.08.00.tar.gz","k2hk-evm-sdk-bin-=
2014.08.00.tar.gz", "K2HK SDK prebuilt PSP binaries and root filesystem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"K2HK SDK Documentation")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"K2HK SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2014.10.01/am335x-evm/webgen.mak b/=
publish-sdk-data/coresdk/2014.10.01/am335x-evm/webgen.mak
deleted file mode 100644
index b0e7d71..0000000
--- a/publish-sdk-data/coresdk/2014.10.01/am335x-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DAM335xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM335xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the AM335x Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2014.10.01
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM335x SDK Essentials")
-	$(call add-link,"ti-sdk-am335x-evm-2014.10.01-Linux-x86-Install.bin","t=
i-sdk-am335x-evm-2014.10.01-Linux-x86-Install.bin","AM335x EVM SDK")
-	$(call add-divider,"AM335x SDK Optional Addons")
-	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_l=
inux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be=
 used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM335x SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"am335x-evm-sdk-src-2014.10.01.tar.gz","am335x-evm-sdk-=
src-2014.10.01.tar.gz", "AM335x SDK PSP Source Code")
-	$(call add-link,"am335x-evm-sdk-bin-2014.10.01.tar.gz","am335x-evm-sdk-=
bin-2014.10.01.tar.gz", "AM335x SDK prebuilt PSP binaries and root filesy=
stem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"AM335x SDK Documentation")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"AM335x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2014.10.01/am437x-evm/webgen.mak b/=
publish-sdk-data/coresdk/2014.10.01/am437x-evm/webgen.mak
deleted file mode 100644
index f2cdc9f..0000000
--- a/publish-sdk-data/coresdk/2014.10.01/am437x-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DAM437xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM437xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the AM437x Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2014.10.01
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM437x SDK Essentials")
-	$(call add-link,"ti-sdk-am437x-evm-2014.10.01-Linux-x86-Install.bin","t=
i-sdk-am437x-evm-2014.10.01-Linux-x86-Install.bin","AM437x EVM SDK")
-	$(call add-divider,"AM437x SDK Optional Addons")
-	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_l=
inux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be=
 used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM437x SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"am437x-evm-sdk-src-2014.10.01.tar.gz","am437x-evm-sdk-=
src-2014.10.01.tar.gz", "AM437x SDK PSP Source Code")
-	$(call add-link,"am437x-evm-sdk-bin-2014.10.01.tar.gz","am437x-evm-sdk-=
bin-2014.10.01.tar.gz", "AM437x SDK prebuilt PSP binaries and root filesy=
stem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"AM437x SDK Documentation")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"AM437x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2014.10.01/am57xx-evm/webgen.mak b/=
publish-sdk-data/coresdk/2014.10.01/am57xx-evm/webgen.mak
deleted file mode 100644
index 961e7b7..0000000
--- a/publish-sdk-data/coresdk/2014.10.01/am57xx-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DAM57xxSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM57xxSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the AM57xx Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2014.10.01
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM57xx SDK Essentials")
-	$(call add-link,"ti-sdk-am57xx-evm-2014.10.01-Linux-x86-Install.bin","t=
i-sdk-am57xx-evm-2014.10.01-Linux-x86-Install.bin","AM57xx EVM SDK")
-	$(call add-divider,"AM57xx SDK Optional Addons")
-	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_l=
inux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be=
 used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM57xx SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"am57xx-evm-sdk-src-2014.10.01.tar.gz","am57xx-evm-sdk-=
src-2014.10.01.tar.gz", "AM57xx SDK PSP Source Code")
-	$(call add-link,"am57xx-evm-sdk-bin-2014.10.01.tar.gz","am57xx-evm-sdk-=
bin-2014.10.01.tar.gz", "AM57xx SDK prebuilt PSP binaries and root filesy=
stem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"AM57xx SDK Documentation")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"AM57xx SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2014.10.01/dra7xx-evm/webgen.mak b/=
publish-sdk-data/coresdk/2014.10.01/dra7xx-evm/webgen.mak
deleted file mode 100644
index 5eef1bc..0000000
--- a/publish-sdk-data/coresdk/2014.10.01/dra7xx-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DDRA7xxSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DDRA7xxSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the DRA7xx Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2014.10.01
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"DRA7xx SDK Essentials")
-	$(call add-link,"ti-sdk-dra7xx-evm-2014.10.01-Linux-x86-Install.bin","t=
i-sdk-dra7xx-evm-2014.10.01-Linux-x86-Install.bin","DRA7xx EVM SDK")
-	$(call add-divider,"DRA7xx SDK Optional Addons")
-	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_l=
inux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be=
 used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"DRA7xx SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"dra7xx-evm-sdk-src-2014.10.01.tar.gz","dra7xx-evm-sdk-=
src-2014.10.01.tar.gz", "DRA7xx SDK PSP Source Code")
-	$(call add-link,"dra7xx-evm-sdk-bin-2014.10.01.tar.gz","dra7xx-evm-sdk-=
bin-2014.10.01.tar.gz", "DRA7xx SDK prebuilt PSP binaries and root filesy=
stem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"DRA7xx SDK Documentation")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"DRA7xx SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2014.10.01/k2hk-evm/webgen.mak b/pu=
blish-sdk-data/coresdk/2014.10.01/k2hk-evm/webgen.mak
deleted file mode 100644
index ef3e138..0000000
--- a/publish-sdk-data/coresdk/2014.10.01/k2hk-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DK2HKSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DK2HKSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the K2HK Core SDK from the LCPD t=
eam.  It is intended as a reference for INTERNAL use only and should not =
be distributed to customers.<br>
-
-VERSION=3D2014.10.01
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"K2HK SDK Essentials")
-	$(call add-link,"ti-sdk-k2hk-evm-2014.10.01-Linux-x86-Install.bin","ti-=
sdk-k2hk-evm-2014.10.01-Linux-x86-Install.bin","K2HK EVM SDK")
-	$(call add-divider,"K2HK SDK Optional Addons")
-	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_l=
inux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be=
 used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"K2HK SDK Individual Components \(all of the below c=
ompoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/t=
runk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2013031=
3_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain=
 - Linaro GCC 4.7 2013.03 hard-float toolchain")
-	$(call add-link,"k2hk-evm-sdk-src-2014.10.01.tar.gz","k2hk-evm-sdk-src-=
2014.10.01.tar.gz", "K2HK SDK PSP Source Code")
-	$(call add-link,"k2hk-evm-sdk-bin-2014.10.01.tar.gz","k2hk-evm-sdk-bin-=
2014.10.01.tar.gz", "K2HK SDK prebuilt PSP binaries and root filesystem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"K2HK SDK Documentation")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"K2HK SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2015.01/am335x-evm/webgen.mak b/pub=
lish-sdk-data/coresdk/2015.01/am335x-evm/webgen.mak
deleted file mode 100644
index 1c81a9d..0000000
--- a/publish-sdk-data/coresdk/2015.01/am335x-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DAM335xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM335xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the AM335x Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2015.01
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM335x SDK Essentials")
-	$(call add-link,"ti-sdk-am335x-evm-2015.01-Linux-x86-Install.bin","ti-s=
dk-am335x-evm-2015.01-Linux-x86-Install.bin","AM335x EVM SDK")
-	$(call add-divider,"AM335x SDK Optional Addons")
-	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_l=
inux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be=
 used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM335x SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"http://releases.linaro.org/15.05/components/toolc=
hain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux=
-gnueabihf.tar.xz","Download Linaro Toolchain","Standalone Linaro Toolcha=
in - Linaro GCC 4.9 2015.05 hard-float toolchain")
-	$(call add-link,"am335x-evm-sdk-src-2015.01.tar.gz","am335x-evm-sdk-src=
-2015.01.tar.gz", "AM335x SDK PSP Source Code")
-	$(call add-link,"am335x-evm-sdk-bin-2015.01.tar.gz","am335x-evm-sdk-bin=
-2015.01.tar.gz", "AM335x SDK prebuilt PSP binaries and root filesystem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"AM335x SDK Documentation")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"AM335x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2015.01/am437x-evm/webgen.mak b/pub=
lish-sdk-data/coresdk/2015.01/am437x-evm/webgen.mak
deleted file mode 100644
index 8a28d69..0000000
--- a/publish-sdk-data/coresdk/2015.01/am437x-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DAM437xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM437xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the AM437x Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2015.01
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM437x SDK Essentials")
-	$(call add-link,"ti-sdk-am437x-evm-2015.01-Linux-x86-Install.bin","ti-s=
dk-am437x-evm-2015.01-Linux-x86-Install.bin","AM437x EVM SDK")
-	$(call add-divider,"AM437x SDK Optional Addons")
-	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_l=
inux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be=
 used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM437x SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"http://releases.linaro.org/15.05/components/toolc=
hain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux=
-gnueabihf.tar.xz","Download Linaro Toolchain","Standalone Linaro Toolcha=
in - Linaro GCC 4.9 2015.05 hard-float toolchain")
-	$(call add-link,"am437x-evm-sdk-src-2015.01.tar.gz","am437x-evm-sdk-src=
-2015.01.tar.gz", "AM437x SDK PSP Source Code")
-	$(call add-link,"am437x-evm-sdk-bin-2015.01.tar.gz","am437x-evm-sdk-bin=
-2015.01.tar.gz", "AM437x SDK prebuilt PSP binaries and root filesystem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"AM437x SDK Documentation")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"AM437x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2015.01/am57xx-evm/webgen.mak b/pub=
lish-sdk-data/coresdk/2015.01/am57xx-evm/webgen.mak
deleted file mode 100644
index 5890635..0000000
--- a/publish-sdk-data/coresdk/2015.01/am57xx-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DAM57xxSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM57xxSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the AM57xx Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2015.01
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM57xx SDK Essentials")
-	$(call add-link,"ti-sdk-am57xx-evm-2015.01-Linux-x86-Install.bin","ti-s=
dk-am57xx-evm-2015.01-Linux-x86-Install.bin","AM57xx EVM SDK")
-	$(call add-divider,"AM57xx SDK Optional Addons")
-	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_l=
inux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be=
 used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM57xx SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"http://releases.linaro.org/15.05/components/toolc=
hain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux=
-gnueabihf.tar.xz","Download Linaro Toolchain","Standalone Linaro Toolcha=
in - Linaro GCC 4.9 2015.05 hard-float toolchain")
-	$(call add-link,"am57xx-evm-sdk-src-2015.01.tar.gz","am57xx-evm-sdk-src=
-2015.01.tar.gz", "AM57xx SDK PSP Source Code")
-	$(call add-link,"am57xx-evm-sdk-bin-2015.01.tar.gz","am57xx-evm-sdk-bin=
-2015.01.tar.gz", "AM57xx SDK prebuilt PSP binaries and root filesystem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"AM57xx SDK Documentation")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"AM57xx SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2015.01/dra7xx-evm/webgen.mak b/pub=
lish-sdk-data/coresdk/2015.01/dra7xx-evm/webgen.mak
deleted file mode 100644
index abff62d..0000000
--- a/publish-sdk-data/coresdk/2015.01/dra7xx-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DDRA7xxSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DDRA7xxSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the DRA7xx Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2015.01
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"DRA7xx SDK Essentials")
-	$(call add-link,"ti-sdk-dra7xx-evm-2015.01-Linux-x86-Install.bin","ti-s=
dk-dra7xx-evm-2015.01-Linux-x86-Install.bin","DRA7xx EVM SDK")
-	$(call add-divider,"DRA7xx SDK Optional Addons")
-	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_l=
inux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be=
 used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"DRA7xx SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"http://releases.linaro.org/15.05/components/toolc=
hain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux=
-gnueabihf.tar.xz","Download Linaro Toolchain","Standalone Linaro Toolcha=
in - Linaro GCC 4.9 2015.05 hard-float toolchain")
-	$(call add-link,"dra7xx-evm-sdk-src-2015.01.tar.gz","dra7xx-evm-sdk-src=
-2015.01.tar.gz", "DRA7xx SDK PSP Source Code")
-	$(call add-link,"dra7xx-evm-sdk-bin-2015.01.tar.gz","dra7xx-evm-sdk-bin=
-2015.01.tar.gz", "DRA7xx SDK prebuilt PSP binaries and root filesystem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"DRA7xx SDK Documentation")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"DRA7xx SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2015.01/k2e-evm/webgen.mak b/publis=
h-sdk-data/coresdk/2015.01/k2e-evm/webgen.mak
deleted file mode 100644
index ea6d769..0000000
--- a/publish-sdk-data/coresdk/2015.01/k2e-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DK2ESDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DK2ESDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the K2E Core SDK from the LCPD te=
am.  It is intended as a reference for INTERNAL use only and should not b=
e distributed to customers.<br>
-
-VERSION=3D2015.01
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"K2E SDK Essentials")
-	$(call add-link,"ti-sdk-k2e-evm-2015.01-Linux-x86-Install.bin","ti-sdk-=
k2e-evm-2015.01-Linux-x86-Install.bin","K2E EVM SDK")
-	$(call add-divider,"K2E SDK Optional Addons")
-	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_l=
inux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be=
 used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"K2E SDK Individual Components \(all of the below co=
mpoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"http://releases.linaro.org/15.05/components/toolc=
hain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux=
-gnueabihf.tar.xz","Download Linaro Toolchain","Standalone Linaro Toolcha=
in - Linaro GCC 4.9 2015.05 hard-float toolchain")
-	$(call add-link,"k2e-evm-sdk-src-2015.01.tar.gz","k2e-evm-sdk-src-2015.=
01.tar.gz", "K2E SDK PSP Source Code")
-	$(call add-link,"k2e-evm-sdk-bin-2015.01.tar.gz","k2e-evm-sdk-bin-2015.=
01.tar.gz", "K2E SDK prebuilt PSP binaries and root filesystem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"K2E SDK Documentation")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"K2E SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2015.01/k2hk-evm/webgen.mak b/publi=
sh-sdk-data/coresdk/2015.01/k2hk-evm/webgen.mak
deleted file mode 100644
index e7426c7..0000000
--- a/publish-sdk-data/coresdk/2015.01/k2hk-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DK2HKSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DK2HKSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the K2HK Core SDK from the LCPD t=
eam.  It is intended as a reference for INTERNAL use only and should not =
be distributed to customers.<br>
-
-VERSION=3D2015.01
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"K2HK SDK Essentials")
-	$(call add-link,"ti-sdk-k2hk-evm-2015.01-Linux-x86-Install.bin","ti-sdk=
-k2hk-evm-2015.01-Linux-x86-Install.bin","K2HK EVM SDK")
-	$(call add-divider,"K2HK SDK Optional Addons")
-	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_l=
inux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be=
 used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"K2HK SDK Individual Components \(all of the below c=
ompoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"http://releases.linaro.org/15.05/components/toolc=
hain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux=
-gnueabihf.tar.xz","Download Linaro Toolchain","Standalone Linaro Toolcha=
in - Linaro GCC 4.9 2015.05 hard-float toolchain")
-	$(call add-link,"k2hk-evm-sdk-src-2015.01.tar.gz","k2hk-evm-sdk-src-201=
5.01.tar.gz", "K2HK SDK PSP Source Code")
-	$(call add-link,"k2hk-evm-sdk-bin-2015.01.tar.gz","k2hk-evm-sdk-bin-201=
5.01.tar.gz", "K2HK SDK prebuilt PSP binaries and root filesystem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"K2HK SDK Documentation")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"K2HK SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2015.01/k2l-evm/webgen.mak b/publis=
h-sdk-data/coresdk/2015.01/k2l-evm/webgen.mak
deleted file mode 100644
index 1924f8d..0000000
--- a/publish-sdk-data/coresdk/2015.01/k2l-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DK2LSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DK2LSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the K2L Core SDK from the LCPD te=
am.  It is intended as a reference for INTERNAL use only and should not b=
e distributed to customers.<br>
-
-VERSION=3D2015.01
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"K2L SDK Essentials")
-	$(call add-link,"ti-sdk-k2l-evm-2015.01-Linux-x86-Install.bin","ti-sdk-=
k2l-evm-2015.01-Linux-x86-Install.bin","K2L EVM SDK")
-	$(call add-divider,"K2L SDK Optional Addons")
-	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_l=
inux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be=
 used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"K2L SDK Individual Components \(all of the below co=
mpoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"http://releases.linaro.org/15.05/components/toolc=
hain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux=
-gnueabihf.tar.xz","Download Linaro Toolchain","Standalone Linaro Toolcha=
in - Linaro GCC 4.9 2015.05 hard-float toolchain")
-	$(call add-link,"k2l-evm-sdk-src-2015.01.tar.gz","k2l-evm-sdk-src-2015.=
01.tar.gz", "K2L SDK PSP Source Code")
-	$(call add-link,"k2l-evm-sdk-bin-2015.01.tar.gz","k2l-evm-sdk-bin-2015.=
01.tar.gz", "K2L SDK prebuilt PSP binaries and root filesystem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"K2L SDK Documentation")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"K2L SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2015.02/am335x-evm/webgen.mak b/pub=
lish-sdk-data/coresdk/2015.02/am335x-evm/webgen.mak
deleted file mode 100644
index 3a524ea..0000000
--- a/publish-sdk-data/coresdk/2015.02/am335x-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DAM335xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM335xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the AM335x Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2015.02
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM335x SDK Essentials")
-	$(call add-link,"ti-sdk-am335x-evm-2015.02-Linux-x86-Install.bin","ti-s=
dk-am335x-evm-2015.02-Linux-x86-Install.bin","AM335x EVM SDK")
-	$(call add-divider,"AM335x SDK Optional Addons")
-	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_l=
inux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be=
 used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM335x SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"http://releases.linaro.org/15.05/components/toolc=
hain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux=
-gnueabihf.tar.xz","Download Linaro Toolchain","Standalone Linaro Toolcha=
in - Linaro GCC 4.9 2015.05 hard-float toolchain")
-	$(call add-link,"am335x-evm-sdk-src-2015.02.tar.gz","am335x-evm-sdk-src=
-2015.02.tar.gz", "AM335x SDK PSP Source Code")
-	$(call add-link,"am335x-evm-sdk-bin-2015.02.tar.gz","am335x-evm-sdk-bin=
-2015.02.tar.gz", "AM335x SDK prebuilt PSP binaries and root filesystem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"AM335x SDK Documentation")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"AM335x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2015.02/am437x-evm/webgen.mak b/pub=
lish-sdk-data/coresdk/2015.02/am437x-evm/webgen.mak
deleted file mode 100644
index ba90b9c..0000000
--- a/publish-sdk-data/coresdk/2015.02/am437x-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DAM437xSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM437xSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the AM437x Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2015.02
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM437x SDK Essentials")
-	$(call add-link,"ti-sdk-am437x-evm-2015.02-Linux-x86-Install.bin","ti-s=
dk-am437x-evm-2015.02-Linux-x86-Install.bin","AM437x EVM SDK")
-	$(call add-divider,"AM437x SDK Optional Addons")
-	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_l=
inux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be=
 used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM437x SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"http://releases.linaro.org/15.05/components/toolc=
hain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux=
-gnueabihf.tar.xz","Download Linaro Toolchain","Standalone Linaro Toolcha=
in - Linaro GCC 4.9 2015.05 hard-float toolchain")
-	$(call add-link,"am437x-evm-sdk-src-2015.02.tar.gz","am437x-evm-sdk-src=
-2015.02.tar.gz", "AM437x SDK PSP Source Code")
-	$(call add-link,"am437x-evm-sdk-bin-2015.02.tar.gz","am437x-evm-sdk-bin=
-2015.02.tar.gz", "AM437x SDK prebuilt PSP binaries and root filesystem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"AM437x SDK Documentation")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"AM437x SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2015.02/am57xx-evm/webgen.mak b/pub=
lish-sdk-data/coresdk/2015.02/am57xx-evm/webgen.mak
deleted file mode 100644
index c7f4a8c..0000000
--- a/publish-sdk-data/coresdk/2015.02/am57xx-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DAM57xxSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DAM57xxSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the AM57xx Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2015.02
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"AM57xx SDK Essentials")
-	$(call add-link,"ti-sdk-am57xx-evm-2015.02-Linux-x86-Install.bin","ti-s=
dk-am57xx-evm-2015.02-Linux-x86-Install.bin","AM57xx EVM SDK")
-	$(call add-divider,"AM57xx SDK Optional Addons")
-	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_l=
inux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be=
 used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"AM57xx SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"http://releases.linaro.org/15.05/components/toolc=
hain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux=
-gnueabihf.tar.xz","Download Linaro Toolchain","Standalone Linaro Toolcha=
in - Linaro GCC 4.9 2015.05 hard-float toolchain")
-	$(call add-link,"am57xx-evm-sdk-src-2015.02.tar.gz","am57xx-evm-sdk-src=
-2015.02.tar.gz", "AM57xx SDK PSP Source Code")
-	$(call add-link,"am57xx-evm-sdk-bin-2015.02.tar.gz","am57xx-evm-sdk-bin=
-2015.02.tar.gz", "AM57xx SDK prebuilt PSP binaries and root filesystem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"AM57xx SDK Documentation")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"AM57xx SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2015.02/dra7xx-evm/webgen.mak b/pub=
lish-sdk-data/coresdk/2015.02/dra7xx-evm/webgen.mak
deleted file mode 100644
index bba2aa1..0000000
--- a/publish-sdk-data/coresdk/2015.02/dra7xx-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DDRA7xxSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DDRA7xxSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the DRA7xx Core SDK from the LCPD=
 team.  It is intended as a reference for INTERNAL use only and should no=
t be distributed to customers.<br>
-
-VERSION=3D2015.02
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"DRA7xx SDK Essentials")
-	$(call add-link,"ti-sdk-dra7xx-evm-2015.02-Linux-x86-Install.bin","ti-s=
dk-dra7xx-evm-2015.02-Linux-x86-Install.bin","DRA7xx EVM SDK")
-	$(call add-divider,"DRA7xx SDK Optional Addons")
-	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_l=
inux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be=
 used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"DRA7xx SDK Individual Components \(all of the below=
 compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"http://releases.linaro.org/15.05/components/toolc=
hain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux=
-gnueabihf.tar.xz","Download Linaro Toolchain","Standalone Linaro Toolcha=
in - Linaro GCC 4.9 2015.05 hard-float toolchain")
-	$(call add-link,"dra7xx-evm-sdk-src-2015.02.tar.gz","dra7xx-evm-sdk-src=
-2015.02.tar.gz", "DRA7xx SDK PSP Source Code")
-	$(call add-link,"dra7xx-evm-sdk-bin-2015.02.tar.gz","dra7xx-evm-sdk-bin=
-2015.02.tar.gz", "DRA7xx SDK prebuilt PSP binaries and root filesystem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"DRA7xx SDK Documentation")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"DRA7xx SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2015.02/k2e-evm/webgen.mak b/publis=
h-sdk-data/coresdk/2015.02/k2e-evm/webgen.mak
deleted file mode 100644
index 62bf347..0000000
--- a/publish-sdk-data/coresdk/2015.02/k2e-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DK2ESDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DK2ESDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the K2E Core SDK from the LCPD te=
am.  It is intended as a reference for INTERNAL use only and should not b=
e distributed to customers.<br>
-
-VERSION=3D2015.02
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"K2E SDK Essentials")
-	$(call add-link,"ti-sdk-k2e-evm-2015.02-Linux-x86-Install.bin","ti-sdk-=
k2e-evm-2015.02-Linux-x86-Install.bin","K2E EVM SDK")
-	$(call add-divider,"K2E SDK Optional Addons")
-	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_l=
inux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be=
 used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"K2E SDK Individual Components \(all of the below co=
mpoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"http://releases.linaro.org/15.05/components/toolc=
hain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux=
-gnueabihf.tar.xz","Download Linaro Toolchain","Standalone Linaro Toolcha=
in - Linaro GCC 4.9 2015.05 hard-float toolchain")
-	$(call add-link,"k2e-evm-sdk-src-2015.02.tar.gz","k2e-evm-sdk-src-2015.=
02.tar.gz", "K2E SDK PSP Source Code")
-	$(call add-link,"k2e-evm-sdk-bin-2015.02.tar.gz","k2e-evm-sdk-bin-2015.=
02.tar.gz", "K2E SDK prebuilt PSP binaries and root filesystem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"K2E SDK Documentation")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"K2E SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2015.02/k2g-evm/webgen.mak b/publis=
h-sdk-data/coresdk/2015.02/k2g-evm/webgen.mak
deleted file mode 100644
index 34afc60..0000000
--- a/publish-sdk-data/coresdk/2015.02/k2g-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DK2GSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DK2GSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the K2G Core SDK from the LCPD te=
am.  It is intended as a reference for INTERNAL use only and should not b=
e distributed to customers.<br>
-
-VERSION=3D2015.02
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"K2G SDK Essentials")
-	$(call add-link,"ti-sdk-k2g-evm-2015.02-Linux-x86-Install.bin","ti-sdk-=
k2g-evm-2015.02-Linux-x86-Install.bin","K2G EVM SDK")
-	$(call add-divider,"K2G SDK Optional Addons")
-	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_l=
inux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be=
 used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"K2G SDK Individual Components \(all of the below co=
mpoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"http://releases.linaro.org/15.05/components/toolc=
hain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux=
-gnueabihf.tar.xz","Download Linaro Toolchain","Standalone Linaro Toolcha=
in - Linaro GCC 4.9 2015.05 hard-float toolchain")
-	$(call add-link,"k2g-evm-sdk-src-2015.02.tar.gz","k2g-evm-sdk-src-2015.=
02.tar.gz", "K2G SDK PSP Source Code")
-	$(call add-link,"k2g-evm-sdk-bin-2015.02.tar.gz","k2g-evm-sdk-bin-2015.=
02.tar.gz", "K2G SDK prebuilt PSP binaries and root filesystem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"K2G SDK Documentation")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"K2G SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2015.02/k2hk-evm/webgen.mak b/publi=
sh-sdk-data/coresdk/2015.02/k2hk-evm/webgen.mak
deleted file mode 100644
index bb766dd..0000000
--- a/publish-sdk-data/coresdk/2015.02/k2hk-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DK2HKSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DK2HKSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the K2HK Core SDK from the LCPD t=
eam.  It is intended as a reference for INTERNAL use only and should not =
be distributed to customers.<br>
-
-VERSION=3D2015.02
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"K2HK SDK Essentials")
-	$(call add-link,"ti-sdk-k2hk-evm-2015.02-Linux-x86-Install.bin","ti-sdk=
-k2hk-evm-2015.02-Linux-x86-Install.bin","K2HK EVM SDK")
-	$(call add-divider,"K2HK SDK Optional Addons")
-	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_l=
inux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be=
 used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"K2HK SDK Individual Components \(all of the below c=
ompoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"http://releases.linaro.org/15.05/components/toolc=
hain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux=
-gnueabihf.tar.xz","Download Linaro Toolchain","Standalone Linaro Toolcha=
in - Linaro GCC 4.9 2015.05 hard-float toolchain")
-	$(call add-link,"k2hk-evm-sdk-src-2015.02.tar.gz","k2hk-evm-sdk-src-201=
5.02.tar.gz", "K2HK SDK PSP Source Code")
-	$(call add-link,"k2hk-evm-sdk-bin-2015.02.tar.gz","k2hk-evm-sdk-bin-201=
5.02.tar.gz", "K2HK SDK prebuilt PSP binaries and root filesystem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"K2HK SDK Documentation")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"K2HK SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/coresdk/2015.02/k2l-evm/webgen.mak b/publis=
h-sdk-data/coresdk/2015.02/k2l-evm/webgen.mak
deleted file mode 100644
index 6d69f9f..0000000
--- a/publish-sdk-data/coresdk/2015.02/k2l-evm/webgen.mak
+++ /dev/null
@@ -1,28 +0,0 @@
-PRODUCT_NAME=3DK2LSDK
-PRODUCT_OR_COMPONENT=3DPRODUCT
-DESCRIPTION=3DK2LSDK
-EMAIL=3Dhttp://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/defa=
ult.aspx
-FOLDER=3Dhttp://www.ti.com/tool/linuxezsdk-sitara
-=20
-DOWNLOAD_TEXT=3D<br>This page contains the K2L Core SDK from the LCPD te=
am.  It is intended as a reference for INTERNAL use only and should not b=
e distributed to customers.<br>
-
-VERSION=3D2015.02
-=20
-# un-comment for debug
-#MK_NOISY=3D1
-=20
-.prod_links:
-	$(call add-divider,"K2L SDK Essentials")
-	$(call add-link,"ti-sdk-k2l-evm-2015.02-Linux-x86-Install.bin","ti-sdk-=
k2l-evm-2015.02-Linux-x86-Install.bin","K2L EVM SDK")
-	$(call add-divider,"K2L SDK Optional Addons")
-	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_l=
inux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be=
 used for ARM debugging on OMAP devices as well.")
-	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sit=
ara ARM README")
-	$(call add-divider,"K2L SDK Individual Components \(all of the below co=
mpoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"http://releases.linaro.org/15.05/components/toolc=
hain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux=
-gnueabihf.tar.xz","Download Linaro Toolchain","Standalone Linaro Toolcha=
in - Linaro GCC 4.9 2015.05 hard-float toolchain")
-	$(call add-link,"k2l-evm-sdk-src-2015.02.tar.gz","k2l-evm-sdk-src-2015.=
02.tar.gz", "K2L SDK PSP Source Code")
-	$(call add-link,"k2l-evm-sdk-bin-2015.02.tar.gz","k2l-evm-sdk-bin-2015.=
02.tar.gz", "K2L SDK prebuilt PSP binaries and root filesystem")
-	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pin=
muxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility=
")
-	$(call add-divider,"K2L SDK Documentation")
-	$(call add-link,"software_manifest.htm","Software Manifest", "Software =
Manifest of Components Inside the SDK")
-	$(call add-divider,"K2L SDK Checksums")
-	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
--=20
2.7.4

