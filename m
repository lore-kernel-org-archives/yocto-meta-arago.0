Return-Path: <d-senicic1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id AA84E529E6
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2019 13:59:59 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7NDwxJe093608
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2019 08:58:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566568739;
	bh=E3FLJPmxAIfu6dEBD0itIw80Mf59uoB8hIJcNMdwXhM=;
	h=From:To:CC:Subject:Date;
	b=I7J5DiZALN2Qu5xUm78GJewUhs+N6mndP1qyIQmFLPLyS5KcUJF0hYX7cMqNaSoSp
	17uVWhuNESW3Joyv97+/JHWl8QOAm/Blz5E7DGyLprN2uyiV6MUwR4jMr0pUdlo6qG
	qvVINprBaGWWFi/CRfPinKyFO3JJWRJNitghhiKQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7NDwxrZ097955
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2019 08:58:59 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 23 Aug 2019 08:58:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 23 Aug 2019 08:58:58 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7NDwwUW118791;
	Fri, 23 Aug 2019 08:58:58 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 23 Aug 2019 09:58:51 -0400
Message-ID: <20190823135856.8053-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCHv2 0/5] Pytorch GLOW AOT tool and demo example
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
X-List-Received-Date: Fri, 23 Aug 2019 14:00:00 -0000
Content-Type: text/plain

This is continuation of work from previous release that did not create nativesdk artifacts properly.
Pytorch GLOW xNN compiler allows Ahead-of-Time compilation of neural network models into CPU object file (for target architecture) using LLVM.
This requires LLVM compiler version 7 or later. Now, the 2020LTS LLVM candidate from oe-core master branch is imported, to avoid unnecessary future upgrades (LLVM8.0.1 version).
Also, there are several native tools that are part of GLOW project that need to be compiled using CLANG/LLVM compiler (from branch 8.0), that is separately pulled in for that
sole purpose (since oe-core does not include CLANG compiler).
Natively compiled tools are used for further building of nativesdk GLOW package which includes single AOT tool, image-classifier, that is deployed in linux-devkit.
End user could use this tool to compile its own xNN model into ARMv7 object file and link with its application. An example, demo-glow, is provided in top level Makefile and example-application.
Small, well known mnist xNN model and several test images, are included in the filesystem.


Djordje Senicic (5):
  mesa,llvm,meson: Update llvm to 8.0.1 plus define and use LLVM version
    globally
  clang8-native: llvm and clang used only for compilation of native
    tools for glow compiler
  glow: Address devkit related RPATH issue to point to devkit shared
    libraries instead of host native
  demo-glow: Restore in top-level makefile examples after recipe cleanup
  packagegroup-arago-tisdk: Include xNN glow based compiler tool into
    devkit, and demo-glow example

 recipes-apps/demo-glow/demo-glow.bb           |  16 +-
 recipes-apps/demo-glow/files/Makefile.build   |   3 +-
 ...sdk-packagegroup-arago-tisdk-host.bbappend |   4 +
 ...group-arago-tisdk-addons-sdk-host.bbappend |  11 ++
 ...oup-arago-tisdk-addons-sdk-target.bbappend |   6 +
 .../packagegroup-arago-tisdk-addons.bbappend  |   7 +
 ...{llvm-glow_git.bb => clang8-native_git.bb} |  16 +-
 ...p-compilation-of-native-helper-tools.patch |  99 ++++++++++
 recipes-devtools/glow/glow_git.bb             |  62 ++++--
 ...ryInfo-Undefine-libc-functions-if-th.patch |  92 +++++++++
 ...-llvm-allow-env-override-of-exe-path.patch |  38 ++++
 recipes-devtools/glow/llvm8_git.bb            | 180 ++++++++++++++++++
 .../ti-tisdk-makefile_1.0.bbappend            |   4 +
 13 files changed, 508 insertions(+), 30 deletions(-)
 create mode 100644 recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bbappend
 rename recipes-devtools/glow/{llvm-glow_git.bb => clang8-native_git.bb} (51%)
 create mode 100644 recipes-devtools/glow/files/0002-Skip-compilation-of-native-helper-tools.patch
 create mode 100644 recipes-devtools/glow/llvm8/0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
 create mode 100644 recipes-devtools/glow/llvm8/0007-llvm-allow-env-override-of-exe-path.patch
 create mode 100644 recipes-devtools/glow/llvm8_git.bb

-- 
2.17.1


