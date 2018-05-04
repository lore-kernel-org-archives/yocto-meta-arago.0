Return-Path: <jjhiblot@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 2F33252090
	for <meta-arago@arago-project.org>;
	Fri,  4 May 2018 09:09:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4499enU015191;
	Fri, 4 May 2018 04:09:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1525424980;
	bh=sqBmI/ValRqqygGEULykMzlFnU1mf7wbC6wScWqb64c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RFuAgN+ttkd8OX+W5wK5wmbGxDON2ZvuhMJaSRkowMzjBQjMGejRk65LEA9w+DCMK
	bxhMadqkAkR/h3vP3Jej8pKc5olhl1nuUlTi5dQoJ1oFre5CQXwVIYnrXPN0FvlaFL
	qjhyMFwG+2q4f3OZyhucu3iNDqtjukyo/b9UB4UA=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4499eHt002755;
	Fri, 4 May 2018 04:09:40 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 4 May 2018 04:09:40 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 4 May 2018 04:09:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4499dKM000924;
	Fri, 4 May 2018 04:09:39 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <denis@denix.org>
Date: Fri, 4 May 2018 11:09:32 +0200
Message-ID: <1525424972-26338-2-git-send-email-jjhiblot@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1525424972-26338-1-git-send-email-jjhiblot@ti.com>
References: <1525424972-26338-1-git-send-email-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [rocko/master][PATCH 2/2] netboot-initrd: fix NFS mount options
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
X-List-Received-Date: Fri, 04 May 2018 09:09:45 -0000
Content-Type: text/plain

busybox does not recognize option 'v3'. 'nfsvers=3' must be used instead.
If no option is provided, then default to 'nolock'

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 .../recipes-bsp/netboot-initrd/files/init-netboot.sh           | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-bsp/netboot-initrd/files/init-netboot.sh b/meta-arago-distro/recipes-bsp/netboot-initrd/files/init-netboot.sh
index 3da1507..2d8792b 100644
--- a/meta-arago-distro/recipes-bsp/netboot-initrd/files/init-netboot.sh
+++ b/meta-arago-distro/recipes-bsp/netboot-initrd/files/init-netboot.sh
@@ -124,9 +124,17 @@ fi
 configure_eth_dev $ip_info
 parse_server_info $server_info ip path options
 
+#default options: "nolock"
+if [ -z "$options" ] ; then
+	options="nolock"
+fi
+
+#busybox mount doesn't recognize 'v3' as a valid option. replace it with nfsvers=3
+options=$(echo $options | sed 's/\<v3\>/nfsvers=3/g')
+
 # mount NFS drive
 mkdir /newroot
-mount -t nfs -o nolock,rw,$options $ip:$path /newroot
+mount -t nfs -o $options $ip:$path /newroot
 
 # switch root. new root is the NFS mount
 exec switch_root /newroot /sbin/init
-- 
2.7.4


