Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAAF110A62FF
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:50:13 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49316.1774536606397246026
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 07:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=GDPJOa1x;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.53, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CUOM62XJSVPstvIeDvPnRZF95Ccv2FYnee+HJGipLp2kq0FC3w3X+R+3CQC/hHeestWHqUPznD0Q2uY4w7A5tWpBJ1SnoeC98+qrZHKherMDCuR/7LQMRNknxT0ArxlbJINWIsSC9NP5V6NZschYAUfSqVuHz6HXXPy3Bn4b/NpbRV1+Hxed2XjUeSIRNlSBqBFq5+UObiUM/YcOKXtHT2eDftBOuvSjBPbMnFSGVSkYDLu6UXN4uSu73EHA+WEqdNyECWikjRKlAW+LJyaQ3djQB83Bo2ET7surv935/YmhTIBAXqmFyxvD3qS3cB8rr4dzaGBbtK96jx061BMTlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRoCjnRgRQymB8iUt+ZczHIEGJvco5eivKExUMQzfX4=;
 b=J2ycynF2YsmKaxopaOQkdIj/k1KEGOm4yIAtMyVjiHJ/vAoucP2I5LxM6MN121UQpAZI/XbsyNKU7SQjF4kBBy8Wgd0A2lL2T3YTGb7LgSnIdCgvtcWTrmE0tpUOAer7ubPZ/yrq00kHyA91A14vhqcS6emZVcrn7ThYMhXzJnLecZ7McBCSLaCHU7xmh6sSFvw1a0b7AREfDhUlafUnxB2JXLLeGeITYd/98ozaDwYI6xx1RAos8tq1o4YYwHlLxFXtaHv8U29UQmIzwwqxvzMVYMy4i62GaqShrZs+q41zJO/nubWNgkkrbaAPX3LuzwA78+XZyaGpWvTYerz6og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRoCjnRgRQymB8iUt+ZczHIEGJvco5eivKExUMQzfX4=;
 b=GDPJOa1xNM3aB82FJ7NDAC7I6cnyzRYhMOVojA5qWtm19hVDXNn7R0DwSPaXC084WvFBeebx0/TC5i//cp/QTzYcz/MdXd3f1NBkGDTX1fJ1vG5jlloyf8o9rZceQveYjUItxNuOI2sJjAp6uWwx6ipuU+TRRrsrUmTPn5K3/ko=
Received: from BN9PR03CA0090.namprd03.prod.outlook.com (2603:10b6:408:fc::35)
 by CH2PR10MB4360.namprd10.prod.outlook.com (2603:10b6:610:ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 14:50:04 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:fc:cafe::dc) by BN9PR03CA0090.outlook.office365.com
 (2603:10b6:408:fc::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.33 via Frontend Transport; Thu,
 26 Mar 2026 14:49:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 14:50:03 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 09:49:49 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 09:49:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 09:49:49 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62QEnnOt1827720;
	Thu, 26 Mar 2026 09:49:49 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w5m1s-00000008wFS-3uou;
	Thu, 26 Mar 2026 09:49:48 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] configs: Add arago-master-luks
Date: Thu, 26 Mar 2026 09:49:48 -0500
Message-ID: <20260326144948.2130523-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|CH2PR10MB4360:EE_
X-MS-Office365-Filtering-Correlation-Id: 6885389f-319b-4076-76ec-08de8b46f677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|18002099003|56012099003|20052099010|13003099007;
X-Microsoft-Antispam-Message-Info: 
	cPJv/D2/yNwuZiBe0EVBffiIViBxpjgQWmVbfZY1btw0uC6j/rortdczalSWadBhCugOn/MIS2qOqkT94AodUQZKd1ZeRoUVdMiQhcgh8YmCh/GhTV1AQdmrquxFmi41teXJ0mfX9uYvMItOab8gTXIrMkVmKAO0qIR8cViPCuWn8U4Ki/X47qO6MXDS7dgEhsw097m6/qhAb55DBYO/Yt2ALPKtshGkJcZ3Z5MZcdvYUC6pkBYNyHWpnItNWCel96GxVUMkOqToVzYtMbmq+glDxuejwgdb9K97AF5FMnFTbXvGUclVUPQhr9c6GlGD29ysFUYCBYh0Fh6H5bJzM/TDV0RROXPCh6HpOWgBe678ZamRK1ssXAInfGtnwm7/a4PmAYx/f6g7fOl9kG/00sVxrWjsYWfLUNzXKAT9OwFZerXgDq+GcAn41Cn2N/93hc5cmxLJPgyZ4ZDoHMtYLxKuw18NvsDd3wyctzJ3w+RoAu+zO7xrJ1aK8AihfrvGFCAfBTgfTPtGlzn3jDdwCC5Qjp1Q3beBHlPH7aMtraM4GglV/J5rvIn2uMNil+whhWhc/Lm5CzL7ED3o39mBNr1KbBY0L8gRmDQX3+wJHpPjHhCTr7/W3dZ1eQV0JZDcRbOd3q1EUbpn0wD+1kQsKpB1AVUoEPav70Kfxo1Dm+vpXyrL95sU+2Abcl4OKMtOQCkddR1nXs8eNUBHDeiB2x8UWmtA73tDET4lw78QlAY=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(56012099003)(20052099010)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gGMRYQHHfGufXsGsuWM7jKFUJC+yKrTTRcyfloS0MDwkN/Ad2I9fNyL81g6omWvBMd69WxebM19gjWe+BSs4F/c1B0Ni+XxZpRHxWzY1jbmuRt8Ao7oZauAPb9k4qWDlSn/2J6Z/+vCTI6OgbrWCwE7DrmaZVAFkr9NgPq5QrWg3M2oCQhGIk0NGNPtc9LdGIQBLOkLVcvBdp75v4JIw0xv/Zcq+8PTRS2zp51PiJfNhuMPIb8g2ic3+kxk1UMl/5jzmgMWxwsquhJbFoJF7kgsTbrpD/PONSVVwF3aezQ/+Mnk10Lm8AmCd4PsASkmllA0BGEFkU0yIUrH5u+2fQBqOSxXj5dzqdJX1/e0XE8b8MzDGDe6yLDZKWqi1LS8zTGjoqfjbmeA2f9lJqZgYdoXOS/yptrmJMdR4y4ewuF9g5PahuIz2X6OzO9vUMOqa
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 14:50:03.0970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6885389f-319b-4076-76ec-08de8b46f677
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4360
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 26 Mar 2026 14:50:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17451

Add new config to show how to build with the luks disk encryption.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...ig.conf.json =3D> arago-master-luks-config.conf.json} | 10 +++++-----
 ...p-10x-config.conf =3D> arago-master-luks-config.conf} |  6 +++---
 ...-master-config.txt =3D> arago-master-luks-config.txt} |  3 +++
 ...selinux-config.yml =3D> arago-master-luks-config.yml} | 10 ++++++----
 ...-master-config.xml =3D> arago-master-luks-config.xml} |  9 +++++++++
 5 files changed, 26 insertions(+), 12 deletions(-)
 copy bitbake-setup/{arago-master-selinux-config.conf.json =3D> arago-maste=
r-luks-config.conf.json} (85%)
 copy conf/fragments/localconf/configs/{arago-scarthgap-10x-config.conf =3D=
> arago-master-luks-config.conf} (61%)
 copy configs/{arago-master-config.txt =3D> arago-master-luks-config.txt} (=
90%)
 copy kas/{arago-master-selinux-config.yml =3D> arago-master-luks-config.ym=
l} (90%)
 copy src/configs/{arago-master-config.xml =3D> arago-master-luks-config.xm=
l} (91%)

diff --git a/bitbake-setup/arago-master-selinux-config.conf.json b/bitbake-=
setup/arago-master-luks-config.conf.json
similarity index 85%
copy from bitbake-setup/arago-master-selinux-config.conf.json
copy to bitbake-setup/arago-master-luks-config.conf.json
index 29e7a19..df33a0e 100644
--- a/bitbake-setup/arago-master-selinux-config.conf.json
+++ b/bitbake-setup/arago-master-luks-config.conf.json
@@ -35,16 +35,16 @@
       },
       "path": "meta-arago"
     },
-    "meta-selinux": {
+    "meta-security": {
       "git-remote": {
         "remotes": {
           "origin": {
-            "uri": "https://git.yoctoproject.org/meta-selinux"
+            "uri": "https://git.yoctoproject.org/meta-security"
           }
         },
         "rev": "master"
       },
-      "path": "meta-selinux"
+      "path": "meta-security"
     },
     "meta-qt6": {
       "git-remote": {
@@ -118,8 +118,8 @@
       {
         "name": "arago",
         "description": "TI Arago distro build",
-        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-ara=
go-extras","meta-arago/meta-arago-test","meta-selinux","meta-qt6","meta-vir=
tualization","meta-openembedded/meta-networking","meta-openembedded/meta-py=
thon","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-open=
embedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/met=
a-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm=
","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
-        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3", "oe-=
layersetup/localconf/configs/arago-master-selinux-config.conf" ],
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-ara=
go-extras","meta-arago/meta-arago-test","meta-security/meta-tpm","meta-qt6"=
,"meta-virtualization","meta-openembedded/meta-networking","meta-openembedd=
ed/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome",=
"meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","m=
eta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-ar=
m/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3", "oe-=
layersetup/localconf/configs/arago-master-luks-config.conf" ],
         "oe-fragments-one-of": {
           "machine": {
             "description": "Available target machines",
diff --git a/conf/fragments/localconf/configs/arago-scarthgap-10x-config.co=
nf b/conf/fragments/localconf/configs/arago-master-luks-config.conf
similarity index 61%
copy from conf/fragments/localconf/configs/arago-scarthgap-10x-config.conf
copy to conf/fragments/localconf/configs/arago-master-luks-config.conf
index 6f4bf47..fed0c94 100644
--- a/conf/fragments/localconf/configs/arago-scarthgap-10x-config.conf
+++ b/conf/fragments/localconf/configs/arago-master-luks-config.conf
@@ -1,4 +1,4 @@
-BB_CONF_FRAGMENT_SUMMARY =3D "Config specific overrides for arago-scarthga=
p-10x-config"
-BB_CONF_FRAGMENT_DESCRIPTION =3D "Config specific overrides for arago-scar=
thgap-10x-config"
+BB_CONF_FRAGMENT_SUMMARY =3D "Config specific overrides for arago-master-l=
uks-config"
+BB_CONF_FRAGMENT_DESCRIPTION =3D "Config specific overrides for arago-mast=
er-luks-config"
=20
-TI_PREFERRED_BSP =3D "ti-6_6"
+DISTRO_FEATURES:append =3D " tpm luks"
diff --git a/configs/arago-master-config.txt b/configs/arago-master-luks-co=
nfig.txt
similarity index 90%
copy from configs/arago-master-config.txt
copy to configs/arago-master-luks-config.txt
index 132a505..c68d49e 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-luks-config.txt
@@ -6,6 +6,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,master,H=
EAD,layers=3Dmeta-arago
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
+meta-security,https://git.yoctoproject.org/meta-security,master,HEAD,layer=
s=3Dmeta-tpm
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
@@ -16,3 +17,5 @@ oe-core,https://git.openembedded.org/openembedded-core,ma=
ster,HEAD,layers=3Dmeta
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
 OECORELOCALCONF=3D./sample-files/local-arago64-v3.conf.sample
 BITBAKE_INCLUSIVE_VARS=3Dyes
+
+LOCALCONF:DISTRO_FEATURES:append =3D " tpm luks"
diff --git a/kas/arago-master-selinux-config.yml b/kas/arago-master-luks-co=
nfig.yml
similarity index 90%
copy from kas/arago-master-selinux-config.yml
copy to kas/arago-master-luks-config.yml
index 65a1925..8446a16 100644
--- a/kas/arago-master-selinux-config.yml
+++ b/kas/arago-master-luks-config.yml
@@ -24,10 +24,12 @@ repos:
       meta-arago-extras:
       meta-arago-test:
=20
-  meta-selinux:
-    url: "https://git.yoctoproject.org/meta-selinux"
+  meta-security:
+    url: "https://git.yoctoproject.org/meta-security"
     branch: "master"
-    path: "sources/meta-selinux"
+    path: "sources/meta-security"
+    layers:
+      meta-tpm:
=20
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
@@ -77,4 +79,4 @@ repos:
=20
 local_conf_header:
   oe-layersetup-local-conf-config-specific: |
-    DISTRO_FEATURES:append =3D " acl xattr pam selinux"
+    DISTRO_FEATURES:append =3D " tpm luks"
diff --git a/src/configs/arago-master-config.xml b/src/configs/arago-master=
-luks-config.xml
similarity index 91%
copy from src/configs/arago-master-config.xml
copy to src/configs/arago-master-luks-config.xml
index c058317..8152482 100644
--- a/src/configs/arago-master-config.xml
+++ b/src/configs/arago-master-luks-config.xml
@@ -31,6 +31,11 @@
         <repo name=3D'meta-selinux' url=3D'https://git.yoctoproject.org/me=
ta-selinux' branch=3D'master' commit=3D'HEAD' disabled=3D'true'>
             <layers/>
         </repo>
+        <repo name=3D'meta-security' url=3D'https://git.yoctoproject.org/m=
eta-security' branch=3D'master' commit=3D'HEAD'>
+            <layers>
+                <layer>meta-tpm</layer>
+            </layers>
+        </repo>
         <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'dev' commit=3D'HEAD'>
             <layers/>
         </repo>
@@ -67,6 +72,10 @@
         </repo>
     </repos>
=20
+    <local-conf>
+        <line>DISTRO_FEATURES:append =3D " tpm luks"</line>
+    </local-conf>
+
     <tools>
         <tool type=3D'oe-layersetup'>
             <var name=3D'BITBAKE_INCLUSIVE_VARS' value=3D'yes'/>
--=20
2.43.0


