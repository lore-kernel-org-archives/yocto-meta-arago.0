Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 5BD2B529EC
	for <meta-arago@arago-project.org>;
	Fri,  8 Apr 2016 17:00:36 +0000 (UTC)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.151])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5B001U8R8KK970@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 08 Apr 2016 12:00:21 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=KPau3ElffHhyB90lyw0A:9
Received: by 100.15.86.14 with SMTP id 0d8a50e4; Fri, 08 Apr 2016 17:00:21 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 98C61161F78;	Fri,
	8 Apr 2016 13:00:19 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 08 Apr 2016 13:00:19 -0400
Message-id: <1460134819-5045-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] opkg-utils: fix typo in the last change
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
X-List-Received-Date: Fri, 08 Apr 2016 17:00:37 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../opkg-utils/{opkg-utils_%.bbappends => opkg-utils_%.bbappend}          | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-devtools/opkg-utils/{opkg-utils_%.bbappends => opkg-utils_%.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-devtools/opkg-utils/opkg-utils_%.bbappends b/meta-arago-distro/recipes-devtools/opkg-utils/opkg-utils_%.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-devtools/opkg-utils/opkg-utils_%.bbappends
rename to meta-arago-distro/recipes-devtools/opkg-utils/opkg-utils_%.bbappend
-- 
2.2.0


