Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 073E7EC1429
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:49:48 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15562.1772534979243613412
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 02:49:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=MsZSMVIr;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.66, mailfrom: m-shah@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LKd/ssR6GIRFB8pjbYKvKWnexBL+Y5zFjTpLsxzs2/gsWH4jGFlRmKddt5R4Y9pfcoRlHLoRjru7BEbLz/CVT/wMHSqhLl+NMkFesP6LHcRW/YCFR6Q0tXWvO1Ab8bYSDSRm9yJE178LMKMaeDmgzmAwb9felxzRT2n3c9EB+8zaqHtEt1YFdTHg90REyayfRx8n/HLZlk34a4cYxci/yf1a0oi6C2U1QtEZAiO9cf3d/0oPMf5oXb7F7jqlaiW7neFU4+ISAmfgDZPtDewlfwjR+ps1C4mGFUVwp+hmxcgqdBGKmZgkyFDK1bKaIHASBVoV6u7EftDWAR8SmnaX1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VEr51foe9DPJPxImBJMZK7YrZ4a0Gn1VSTFEFEW4z7g=;
 b=nfoEWEa92ku1bqOnNs4tT6rPhDs7PtYas9zLPljBngNQ7nMMtMgHcAL88H5FAWyPAVCtQZyxON35tPz4+MIEHQRfCWGsBlwre6tfQW9OJ2ZGUojFQTObh7WDxXIZr0qndUg1HZqg+J7FrCJNuhjW6bmhUlU5QAwl/hyjRY/IeWvp2apRUnkNDi7j2YZ/KvGoiu1quOWAX0OvKc/lUoVkUy/rKhq7+DizgEtzumwMwmAJ72H464L7ujrNq2ACRJKK7HaRLLMU+jhIk8eUPRLPQQ6jOdLbq5laSM/ARxjjK2eNwmy062nftxwGsnv/814yKLMyFhiwbgFlvXq/UoEilQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VEr51foe9DPJPxImBJMZK7YrZ4a0Gn1VSTFEFEW4z7g=;
 b=MsZSMVIr3MQTXplOJIFlXH13KlMhAMjWswQyTTW/hjw0J/8Vz9PYvSFdR5OtTwG8SG/yPo87za7UtMJ3m51HnBPwqJ2PCAzesJzdumtXNxC6k0lOO/7aJkXIpEvkxBqA+8lf2d+pJZi7jaoGDl12pyNKZUkNOMJ+rbYrs5zKPh4=
Received: from BL1PR13CA0270.namprd13.prod.outlook.com (2603:10b6:208:2ba::35)
 by SA1PR10MB6415.namprd10.prod.outlook.com (2603:10b6:806:25a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Tue, 3 Mar
 2026 10:49:35 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:208:2ba:cafe::87) by BL1PR13CA0270.outlook.office365.com
 (2603:10b6:208:2ba::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 10:49:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 10:49:34 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 04:49:34 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 04:49:34 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 04:49:34 -0600
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623AnV6E1988049;
	Tue, 3 Mar 2026 04:49:31 -0600
From: Moteen Shah <m-shah@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <a-limaye@ti.com>, <m-shah@ti.com>,
	<gehariprasath@ti.com>, <praneeth@ti.com>, <denys@konsulko.com>,
	<vigneshr@ti.com>
Subject: [PATCH] tisdk-uenv: Add instructions to load initramfs while booting linux
Date: Tue, 3 Mar 2026 16:19:30 +0530
Message-ID: <20260303104930.889956-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|SA1PR10MB6415:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ee0587c-794b-4610-b6df-08de79128f23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	uzjPAoxbCS3ch9fpbY5yC9l1+oZhn4ACbOuLliDQoRwSklTXUVLUj8Dzg3ggkQ/z/jRVpwasQ6y/+pjX2oNWKtM+Gz5c0ARFgxDfjI7xSB2R3yZNQ6BrCJZazOtirpeqoAP2YU/6k0BFhMf8rjSLL2l78OMREXSdCNbPdpXXeBq9LXAfAkQoKW3MOqm8lzqCAorBmksoDu3JtG/DNMGCuDMD9JFnZPXBrViM1cVpOyzIyP9FGs6nj/Ou+Pr2TD0CuYq1FrwidXCHnquAntOWTqTyXF7FL9LQ2uiNClZVtW+tGtrA24zd8S1b4rw9Bc7b5sJRJOiKABbWki129fbBw8UZtOzBx3hSxqA28yxtXZ/7QSNtPRfxRvw8mjDoZYvFFtLIPa2J5fFC7FfZkXeGdA4uUf/rTNyux9EH7h55Yu6YdDLJrxZX/54GQHnGACXXzjai742U1rcxUIQLFpidimVUZ6BYpEI7ujMrmPh5wRytZNus7aBDmKfAC3LkYBY7fvzwbXfxDXVe7YimViI2P7ekaUjdqiKOnsTvpWFdw/0l9dX9Smhox+1GdLTKUPBDbaSgsV6QQH69+nO7d/hGfdy2wVldjinol3qIUTVKwEaPAHn0Jzntn9AOq+q5jeMbjj/Wf3/EjCTBayVzfagHew6MKdp5KOj4SZ6v15tpoTX9Bmn/4F+B+ibEdZS4f0JmDGJdsycBPBlwsobPoPwjhJDT+nEu3pGZ6JfJIp9U79Ct86EXxxq2johqfgZKtj/u2VLB+M6p/EYPTq4uPe5x5lIoHf3D1MUYiUxziUGCAMvs7EQRerlUoe0oJcNu7iPrPWYU9+5z+N1kxAQxofoX/g==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JY1ijaeZE+UpBXQOSLyuaWrmGvRflxcl4+qbv4xsTWjaAPoUxt/GRoqLwp2HL35myBHhP9gY+hcJfb/wNtmZL6h1LJqJ60ME+G+2Amd+muOMl0xq3N84a+BNWNzWKjzF5shGdGnDyHVp2G47eDv3Lv19Me3uJ8pu/tgcJ8G2/TYmYOi8etKPJcbvD6leFQ8OuE1ZtB56q1ORj6c+4u+j/q3gIis9bhRWkkzKpDhiuxf/L57SPegj1M7ez5V1uirAykYGj05DGEMajRQVLexKm5tUkgOjULKMTt2w23c4aCYn2TPR4bfPCCm1IdxVdMs9eR5Y3oi/9t8I2Iel28+eZ3PJN4YyID7ye9AiqtPrINJWvURM7C+NQPen0lea7lIAHDI7dYpM78uAdc8g+TGBorTV+t3msjD5J9ReIFNtMEAkVEAGLIb+tlrvhtrvyZ4s
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 10:49:34.9825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee0587c-794b-4610-b6df-08de79128f23
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6415
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Mar 2026 10:49:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17191

Add instructions to load initramfs image and update the boot command
to use the image to boot the linux kernel.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 .../recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt=
 b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
index 0af0eef3..5ac61b34 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
+++ b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
@@ -7,3 +7,18 @@
 #       default on all newer U-Boot images.  This also means that some
 #       variables such as bootdelay cannot be changed by this file since
 #       it is not evaluated until the bootcmd is run.
+
+# Initramfs configuration
+# Name of the initramfs file in the boot partition
+name_initramfs=3Dti-core-initramfs.cpio.xz
+
+# Command to load initramfs from boot partition (mmc device:partition)
+# Adjust the device number (0 or 1) based on your setup
+# mmcdev is set to 1 by default, partition 1 is the boot partition
+get_initramfs_mmc=3Dfatload mmc ${mmcdev}:1 ${rdaddr} ${name_initramfs}
+
+# Load initramfs and set up variables
+load_initramfs=3Dif run get_initramfs_mmc; then setenv _initramfs ${rdaddr=
}:${filesize}; setenv rd_spec ${_initramfs}; echo Initramfs loaded at ${rda=
ddr}, size ${filesize}; else echo WARNING: Initramfs not found, continuing =
without initramfs; setenv rd_spec -; fi
+
+# Custom boot command that loads initramfs before kernel
+init_mmc=3Drun args_all args_mmc load_initramfs
\ No newline at end of file
--=20
2.34.1


