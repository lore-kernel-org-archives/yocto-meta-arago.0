Return-Path: <dannenberg@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A08C7619A
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 16:44:16 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.19798.1679330646990999175
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 20 Mar 2023 09:44:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sZl/OjVN;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dannenberg@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32KGi6HC019474
	for <meta-arago@lists.yoctoproject.org>; Mon, 20 Mar 2023 11:44:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1679330646;
	bh=YRrpTB7IwrUqXtrhtkZr6xds1OmFDCFihTY4btKUS0Q=;
	h=From:To:CC:Subject:Date;
	b=sZl/OjVNLLYdsEycLhCO9Do3m8zQBQG/zHYzpN+QCUlijsY6RZ0el6Cz+RJizVten
	 SwJZw9H9QZvR8mGnichZ+3r/kRIIcVxi7leusQuAap1jdMGQx+8UqtP6zfJubdFvV1
	 k5T5379UPcAy8pSkJmq1uXQRra5tEZXe9nwZhjJ8=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32KGi6EI029580
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 20 Mar 2023 11:44:06 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 20
 Mar 2023 11:44:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 20 Mar 2023 11:44:05 -0500
Received: from dasso.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32KGi5hd032229;
	Mon, 20 Mar 2023 11:44:05 -0500
From: Andreas Dannenberg <dannenberg@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: Andreas Dannenberg <dannenberg@ti.com>, <c-shilwant@ti.com>,
        <s-adivi@ti.com>
Subject: [meta-arago][tisdk-setup-scripts][master] setup-uboot-env-am65x: Fix/update overlay ENV variable in get_overlay_net
Date: Mon, 20 Mar 2023 11:44:04 -0500
Message-ID: <20230320164404.1033686-1-dannenberg@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 20 Mar 2023 16:44:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14263

The U-Boot ENV variable containing a list of DTB overlays to be applied
has since changed to 'name_overlays'. Update the AM65x specific ENV
setup script to account for that.

Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
---

Sai,
this fixes an issue reported on the E2E [1] actually quite a while ago.
We should try to get this into the upcoming AM65x SDK v8.x build.
Thanks.

[1] https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1074355/tmdx654idkevm-network-boot-do-not-apply-overlays



 setup-uboot-env-am65x.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/setup-uboot-env-am65x.sh b/setup-uboot-env-am65x.sh
index b6e043b..049a254 100644
--- a/setup-uboot-env-am65x.sh
+++ b/setup-uboot-env-am65x.sh
@@ -155,7 +155,7 @@ do_expect "\"$prompt\"" "send \"setenv init_net 'run args_all args_net; setenv a
 do_expect "\"$prompt\"" "send \"setenv args_net 'setenv bootargs console=\${console} \${optargs} rootfstype=nfs root=/dev/nfs rw nfsroot=\${serverip}:\${nfs_root},\${nfs_options} ip=dhcp'\"" $cwd/setupBoard.minicom
 do_expect "\"$prompt\"" "send \"setenv get_kern_net 'tftp \${loadaddr} \${name_kern}'\"" $cwd/setupBoard.minicom
 do_expect "\"$prompt\"" "send \"setenv get_fdt_net 'tftp \${fdtaddr} \${name_fdt}'\"" $cwd/setupBoard.minicom
-do_expect "\"$prompt\"" "send \"setenv get_overlay_net 'fdt address \${fdtaddr};fdt resize 0x100000;for overlay in \${overlay_files};do;tftp \${overlayaddr} \${overlay};fdt apply \${overlayaddr}; done'\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv get_overlay_net 'fdt address \${fdtaddr};fdt resize 0x100000;for overlay in \${name_overlays};do;tftp \${overlayaddr} \${overlay};fdt apply \${overlayaddr}; done'\"" $cwd/setupBoard.minicom
 
 do_expect "\"$prompt\"" "send \"setenv nfs_options 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
 do_expect "\"$prompt\"" "send \"setenv setup_mmc ''\"" $cwd/setupBoard.minicom
-- 
2.34.1


