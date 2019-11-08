Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id D5F2C52A14
	for <meta-arago@arago-project.org>;
	Fri,  8 Nov 2019 22:44:10 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA8MglJd012704
	for <meta-arago@arago-project.org>; Fri, 8 Nov 2019 16:42:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573252967;
	bh=/T+Ttjs+Q8dHnLYI0U0eAp8gbHgU/qtgHXB8qKsT7ys=;
	h=From:To:Subject:Date;
	b=unyZXEDeXp4+kut93+c9vTgoMIjtp4mvocctSvrPTGIhfeNUS6kwBdFxsX8HHvSYA
	mpQlGlJzY5jPcPVVAZk3o66zIhQF3FLnUvtiQYeTA3Q+1VUPxkUIDVnwW9dg3vHiZq
	Ieq/IGXyzgidVEwMPBsx14P3TV588KN6xP4cXg1o=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA8MglSC031847
	for <meta-arago@arago-project.org>; Fri, 8 Nov 2019 16:42:47 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 8 Nov 2019 16:42:31 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 8 Nov 2019 16:42:31 -0600
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA8Mgkm9115946
	for <meta-arago@arago-project.org>; Fri, 8 Nov 2019 16:42:46 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 8 Nov 2019 17:42:32 -0500
Message-ID: <20191108224236.50548-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH 0/4] Enable glmark2 2017.07
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
X-List-Received-Date: Fri, 08 Nov 2019 22:44:11 -0000
Content-Type: text/plain

Enable glmark2 2017.07 with Mesa-based EGL

Eric Ruei (4):
  Revert "glmark2: specify dependency on libgbm"
  Revert "glmark2: add tilcdc and tidss to the list of drm modules for
    AM3 and AM6 respectively"
  Revert "glmark2: overlay version 2014.03 locally"
  glmark2: restrict udev enumeration to card0 only

 ...-restrict-udev-enumeration-to-card0-.patch | 38 ++++++++++++
 .../glmark2/glmark2_git.bbappend              |  6 ++
 ...hould-be-destoryed-after-the-wl_wind.patch | 34 -----------
 ...-add-tilcdc-and-tidss-to-drm_modules.patch | 28 ---------
 .../files/Fix-configure-for-sqrt-check.patch  | 13 ----
 ...ages-to-be-used-by-the-enabled-flavo.patch | 43 -------------
 .../recipes-benchmark/glmark2/glmark2_git.bb  | 61 -------------------
 7 files changed, 44 insertions(+), 179 deletions(-)
 create mode 100644 meta-arago-distro/recipes-benchmark/glmark2/glmark2/0001-native-state-drm-restrict-udev-enumeration-to-card0-.patch
 create mode 100644 meta-arago-distro/recipes-benchmark/glmark2/glmark2_git.bbappend
 delete mode 100644 meta-arago-extras/recipes-benchmark/glmark2/files/0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch
 delete mode 100644 meta-arago-extras/recipes-benchmark/glmark2/files/0001-native-state-drm-add-tilcdc-and-tidss-to-drm_modules.patch
 delete mode 100644 meta-arago-extras/recipes-benchmark/glmark2/files/Fix-configure-for-sqrt-check.patch
 delete mode 100644 meta-arago-extras/recipes-benchmark/glmark2/files/build-Check-packages-to-be-used-by-the-enabled-flavo.patch
 delete mode 100644 meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb

-- 
2.17.1


