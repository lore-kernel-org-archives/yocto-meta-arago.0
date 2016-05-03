Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTPS id 08DBC529A4
	for <meta-arago@arago-project.org>;
	Tue,  3 May 2016 01:43:11 +0000 (UTC)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.153])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6K00BDAVFJRV50@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 02 May 2016 20:42:55 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=LXOqcXpmZxEsR-ukzmAA:9
Received: by 100.15.86.14 with SMTP id 1819b0ae; Tue, 03 May 2016 01:42:55 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A805D161FD2;	Mon,
	2 May 2016 21:42:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 02 May 2016 21:42:53 -0400
Message-id: <1462239774-18541-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] php, libdrm: make local patches version-agnostic
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
X-List-Received-Date: Tue, 03 May 2016 01:43:12 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/php/{php_5.5.21.bbappend => php_%.bbappend}          | 0
 .../recipes-graphics/drm/{libdrm_2.4.66.bbappend => libdrm_%.bbappend}    | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-devtools/php/{php_5.5.21.bbappend => php_%.bbappend} (100%)
 rename meta-arago-distro/recipes-graphics/drm/{libdrm_2.4.66.bbappend => libdrm_%.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-devtools/php/php_5.5.21.bbappend b/meta-arago-distro/recipes-devtools/php/php_%.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-devtools/php/php_5.5.21.bbappend
rename to meta-arago-distro/recipes-devtools/php/php_%.bbappend
diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm_2.4.66.bbappend b/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-graphics/drm/libdrm_2.4.66.bbappend
rename to meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
-- 
2.2.0


