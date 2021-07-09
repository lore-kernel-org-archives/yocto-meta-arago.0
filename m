Return-Path: <nm@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 4BBFE52AE5
	for <meta-arago@arago-project.org>;
	Fri,  9 Jul 2021 18:03:58 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 169I4460107446;
	Fri, 9 Jul 2021 13:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625853844;
	bh=eCOSlZGKOhIGmiKyld18HiOWWg7I0WgMcT5HGQ6GG1Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xLeNcO+wsKgyRPZsvD1gxgFnw5f6Op2lYjwuh36mduQqbsZpzhw/y+zv1zpdp2FiU
	3O61pRNQ9xYbG2lDUg+4zJf/r66iwVTUrUlyY+1y8fBUjlxIzUuYl8UuJFd3ynFSMQ
	+oZ/anF3/n8QlavEZR5htz5ur2Sv3tdJr5hCe8yw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 169I42nd086808
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jul 2021 13:04:04 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 9 Jul 2021 13:04:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Fri, 9 Jul 2021 13:04:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 169I44pl092759;
	Fri, 9 Jul 2021 13:04:04 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <praneeth@ti.com>, <yogeshs@ti.com>
Date: Fri, 9 Jul 2021 13:03:57 -0500
Message-ID: <20210709180401.2977-2-nm@ti.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709180401.2977-1-nm@ti.com>
References: <20210709180401.2977-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [tisdk-build-scripts PATCH 1/5] config-build-env: Move the oe-layer-setup to a variable
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
X-List-Received-Date: Fri, 09 Jul 2021 18:03:59 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Lets first start preparing for cleanup by moving the git url to a
variable.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 lib/oesdk/config-build-env | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/oesdk/config-build-env b/lib/oesdk/config-build-env
index 8bbd0df28c63..11fab2de6097 100644
--- a/lib/oesdk/config-build-env
+++ b/lib/oesdk/config-build-env
@@ -1,5 +1,7 @@
 #!/bin/bash
 
+TI_SDK_OELAYER_SETUP="http://arago-project.org/git/projects/oe-layersetup.git"
+
 # This script is intended to be called only from the top-level build-oesdk.sh
 # script which parses the configuration file and sets necessary variables.
 # So check if it is being called from any other context and if so exit.
@@ -21,7 +23,7 @@ checkout_layer_scripts() {
 
     if [ ! -d $name ]
     then
-        git clone http://arago-project.org/git/projects/oe-layersetup.git $name
+        git clone "$TI_SDK_OELAYER_SETUP" $name
     elif [ -d $name/.git ]
     then
         #This looks to be a git repo.  Hopefully it is the right one :)
-- 
2.32.0


