Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 4BE3552999
	for <meta-arago@arago-project.org>;
	Fri, 23 Oct 2020 21:38:09 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09NLZ3JN062398
	for <meta-arago@arago-project.org>; Fri, 23 Oct 2020 16:35:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603488903;
	bh=G1u7XKrssqqxbuK2Tv7GK2UFQjokL+x1UOnE1FZTgJE=;
	h=From:To:CC:Subject:Date;
	b=yvrZOwbUQYqCS10ppf5A+WDQ/lRK6DbgbfYQaV7ZOXxmqnxfD+NVtLnN7nDLANmQH
	nC43BTx3mPBl4y3MOvhiKNbsiUEMOwp35dXQ71oevdRH6rrse6JgG8dFLc7JgTHWm9
	BjDEBjmkRho07LVLViC8GME36KweExphjlj34Q8w=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09NLZ3Y9061603
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 23 Oct 2020 16:35:03 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 23 Oct 2020 16:35:02 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 23 Oct 2020 16:35:02 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09NLZ182004122;
	Fri, 23 Oct 2020 16:35:01 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.246] (may be forged))
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 09NLZ1pf072421;
	Fri, 23 Oct 2020 16:35:01 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Denys Dmytriyenko <denys@ti.com>, Dan
	Murphy <dmurphy@ti.com>
Date: Fri, 23 Oct 2020 16:34:57 -0500
Message-ID: <20201023213457.31630-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell/master][PATCH v2] cairo: enable gles2 support
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
X-List-Received-Date: Fri, 23 Oct 2020 21:38:09 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

add gles2 support for devices which can support it.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
v2:
  - Use of DISTRO_FEATURES is bringing up some stale dependency issues
    for k2 devices. Changing it to MACHINE_FEATURES, its a valid filter
    here as well.

 meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend

diff --git a/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend b/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
new file mode 100644
index 00000000..6076f370
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
@@ -0,0 +1,3 @@
+PR_append = ".arago1"
+
+PACKAGECONFIG_append = " ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'egl glesv2', '', d)}"
-- 
2.17.1


