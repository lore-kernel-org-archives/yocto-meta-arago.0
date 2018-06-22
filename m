Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id BC00A529CA
	for <meta-arago@arago-project.org>;
	Fri, 22 Jun 2018 18:32:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5MIWo8l016135
	for <meta-arago@arago-project.org>; Fri, 22 Jun 2018 13:32:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1529692370;
	bh=RqwEEk+M8WKhxaQUjjpfugS43spP6v48zOHw5aLxUUY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=v8HYoPEA8KFFLPHcOIfYSkvzJAao1Cx3L1yOM4dn8DBEcC2KzWb81o6J6AMb+5nNq
	236s6261ZFIIUI9rxabcHfkETfmq4C+HiV0oP56uKBpXFdUMlnmvesqvCZQKV5CZyK
	YsmhpucOQF6kq6Qt+974jZdcJJP1e+mjKVsQTQRg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5MIWo0d012547
	for <meta-arago@arago-project.org>; Fri, 22 Jun 2018 13:32:50 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 22 Jun 2018 13:32:50 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 22 Jun 2018 13:32:50 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5MIWn0c021857;
	Fri, 22 Jun 2018 13:32:50 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Jun 2018 14:21:11 -0400
Message-ID: <1529691675-25624-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1529691675-25624-1-git-send-email-j-stiffler@ti.com>
References: <1529691675-25624-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: ajayj@ti.com
Subject: [meta-processor-sdk][PATCH 2/6] pckagegroup-arago-tisdk-opencl: add tidl-examples-dev
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
X-List-Received-Date: Fri, 22 Jun 2018 18:32:58 -0000
Content-Type: text/plain

* Include the dev package so that build dependencies are available in
  the filesystem.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
index 16e042e..782affe 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
@@ -1,6 +1,6 @@
 PR_append = ".tisdk0"
 
-TIDL_PKGS = "tidl-examples tidl-viewer"
+TIDL_PKGS = "tidl-examples-dev tidl-viewer"
 
 EXTRA_PKGS_append_am57xx-evm = " ${TIDL_PKGS}"
 EXTRA_PKGS_append_am57xx-hs-evm = " ${TIDL_PKGS}"
-- 
2.7.4


