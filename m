Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29402C53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 20:13:36 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10.1785269608579178582
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 13:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=DL2CQYNa;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=SfiZ6LqE;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SIAWBD193261;
	Tue, 28 Jul 2026 15:13:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=58OIliAdT1NK5
	xok21oATwOyH+vfyuwdWKC2E07xi/E=; b=DL2CQYNasFFP9VQXiPJpKEkuTGqxX
	BbGGeeEO24wsMiWuIYbpsK0UUW9o/7KUSDeA/QUO4Al96CQAdFpzgmRNBMMy419d
	ibRG0f2kmAsr1bvHmKuuxf7LHi4cpLaUBPhZasdO9I53X8H4REEBBvGGyrz8MNWW
	q6XWBagdqQCu8+v45KIP21P2DTavrAu3pZwMjTXrE3fhbphqHuxy4Q04xqnxRf1G
	dIqu4qgn1CKz4JWTlAuyVHfFIACzvBaDmGH1dikxJRSCj8Tz420JMWHZUJfbAIAq
	aIJTeZGFRz59wKXaRMF/5ePfXEICZKPGBM3I24PM5dcTYWUNdWf8pCjIA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012031.outbound.protection.outlook.com [52.101.53.31])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fpvexk85h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 15:13:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uN5N22iEmHa+JPY7Vm2RWZ7O9YXu9efM33LyBQ6TOGIT9PnYqWeWLN35wPbe/rUGQCbsjIsm+HCFBgCk+6e/dPOLrmMkxBBa1Iw7qNv5j2EH9VJutDDXBLXUnvyapTYZdTVXdnMD+mcIfnlzXAVt2hUAStrlfxZpYhj1iSK8DD0GDLc9f3gdw0ThzdsTcSbdb076PJgZPE3mKW9pNMrb/CexDHraFyD2QmkeWnCx++r7eFn9BhEw2/wzYqInui4WS1TLKiKOHpGmwAEGgTV6keuAtMsN5Ug3qOw/peEmtcSYejgzpAMBAKLFEcerPBWR0cGeVg2pYEQcS7x/bxXRjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58OIliAdT1NK5xok21oATwOyH+vfyuwdWKC2E07xi/E=;
 b=itQIpuHOVIlLVZEoqTofJWmIcnBMmX4eWIuhAPJZpa8N92W+tvMgJ2plD+Y8y4XDcIRAAa3ENmGM+wAC9/QcMHhZbVQMBkHj9vN14Rjzcmlb4XfoD6FbnEWQ3iUqGudSD+wBmJF3Bs8kTLpnt6feo5Np75fLtWubMbgX9u2RYFC9xA0z/UvdTleRgKr+viGMcKyH2r/gv9QYEeMapMAVvXgZzpdIGbc35izd6ueEsCrm1APIMAw7mdGWF3JGOmgc3ZkbPGofs3Nd4hLEupu69jNZIbRZ7tIFnVlvacbi6jXRIyM/Nh9bwA5GdjE3UL1QNB8e/so4poMopsbWT1kaKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58OIliAdT1NK5xok21oATwOyH+vfyuwdWKC2E07xi/E=;
 b=SfiZ6LqEbFTaECUrX3jZk4YxVzTL4bLPpZma+HZNNVXMyhRkpOgWkm9VgZPXAfeE+15lRk++L0JOE+7cvPVJ5jDqH8PODu2CzULU+TxIFJzF1tXe4obQ7CA7IHO9/Q29vlSuUhj6s78aLuD+joO9f6+r7ecxQqaFniR16sZzBzc=
Received: from SN7PR04CA0198.namprd04.prod.outlook.com (2603:10b6:806:126::23)
 by CH2PR10MB4246.namprd10.prod.outlook.com (2603:10b6:610:a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 20:13:23 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:126:cafe::10) by SN7PR04CA0198.outlook.office365.com
 (2603:10b6:806:126::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 20:13:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 20:13:22 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 15:13:22 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 15:13:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 28 Jul 2026 15:13:22 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66SKDLXY3378511;
	Tue, 28 Jul 2026 15:13:21 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wooAz-0000000C2IY-3gPr;
	Tue, 28 Jul 2026 15:13:21 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] convert.pl: Add wrynose as a valid branch
Date: Tue, 28 Jul 2026 15:13:21 -0500
Message-ID: <20260728201321.2868763-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|CH2PR10MB4246:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d5106d1-3981-4691-4ced-08deece4ac95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	RRH+UlNlY9/3dAyf99fBATLhYrNii++oIwIESoC3sfM21mUlN9+P4JRIzHp+hqHBcXgf1TsU3swSI6vlSavI+6HBwzphnsg+39gGx4TttmeCprcuwAl2ksJohbP3qjjPwl/42nnW6cmqwBr3xEbZ8mniYAsV+qc8JVnJ5jW1+RHnWzyvCHAtxAwCqHE8R8prqKZpeib/oqHOTETzZEges+RdVDJhDgO6Qsqy14hEOkUjNj9RJ2c2z93lIastyftOmnDf8EvaoT4jsZrg8omK+JPcXczsg56h+priAkRK/JErJexR+3AKlt3KEWFKau2k0XJHgFEu2UEzzqulJkXgF1ibcP7AVnGQ6HHrVJ15QkRj+o7cE4IDYo9rez4O3doDPNMbZp6mlPr3KLCibDdDzHlam0Ya792D9WHSRt79JNMQwMnFX1728yauwy32UTy+8nNpo8/4GDFQ5J76zy6FSDyvo5WOzORf6vZxJNXZopAOr/1bCXsuy0aoopQARcS3sk2FHbCv2eVu54DeVrzY09Ui+WxcvqzDPrEwAEgHrfr+y1B0GL3MJEWL0tNwMiXemDzBMhhigSrFWn4rNBz+mYYrEMQycHPkWlPlyLQnXf5KAMYioFsu1xEOwemXLsAn2FY9NeCK4JFMU/q0rxS+a0fyLvii8O079wUXcP+V6cWN6ZcRku0L87p9qBrkXv45iLxsNzyRQ6KM6h6NenO/EA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LTbh8GypM8A4vH6A53g8lhNdodgRAnVt11NmeP6fYWSIwilJJJdQYejVrTNkrPXwW/ANvmo73szupoAD0HUGRxivRGlxBh/zDZlcmwYXdsZrrZKMA/FQnifwaRwJSM7YL8n9mdY3jKIjSIhQhuycnaN7heVSMu5jVnzzi79UcIuOmMlKdU0E+PP27k1r7tJ3LzpHgv5nhLuK11wrR6A2WBvIJ7iZclMKxfIVq3crXZHgyhfm2kauCnBQ5EOgOaSJeeq2zAN5FJkzZ6GApf/rMP+O9Qg89+eat8Zcd0yFeQJ1fTkpwhhD1naRj6RicGxvvnCvmyzaA4HF9L63S0GI+Gpj6376nPwM1PEtZQ3tr8iFMQ2bc9DWtgjG41tdkhOYu134ODb/Hero+KszxyTXlNIEFR+VfAuJjutQ5EXQMZqxMB6wH8oQ7KDNZuUb1VrI
X-Exchange-RoutingPolicyChecked: 
	JSfn1WnLwzNdSRakcmPn8x9JpW0x4wHy1WwmAQ6J6RU/PbI7kLcXMTObgUfooKQd0JRX+BTfwZ9jYP0Run+rIezZS5JD8VO0PX9rhMWJRf3LdSXr/VVfvFlaIXzFTzkuphJ+f9tmIxHFo7VB++i8D5S1l7ETzRxxI5GxTz+ooT5SYsqgel+syqIkqWV4Yx2v9NQX6PEoyIqeWgC7tE8j4QVOOt6TlfrbwulMbB+gAM801dMTZhk7BY4vsYXDmLVruz64kYxMmRHBB8vyjjBJuiiFxXvcXp/V/3SSQfTkHuSlLgdwbcWE/Bv4xkHdGn24HFFiQt5g7z68vAccmrSKYw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 20:13:22.4679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5106d1-3981-4691-4ced-08deece4ac95
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4246
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE3MyBTYWx0ZWRfX88QTeGisYwu7
 KKSzKyPTSncsL9ZHsVS/1FREPn3nvOJvyfCtw3o3FVXP9AsU99KGaCNK1sd8NZDBQrVeA+DIar9
 GVnpH22Jm1hxJKwedQGPNtBRG2SQKKF8urpzFQAAT8E2VTrT91xt40tyHL5bZzBPSGB61xnhgQe
 G6ApKBTqtYF2iimYkV0boKEbsbUH7WvgfVjwVrJNuzmXQ6HKZZSI/xnksQ5nFYOwmCNnqEHtpfd
 5ftakHBATFO+tHTYHU5fv6szkbcwdvXAEBhFNdgPxj4qa3TwUN4JjkxHLFyZczDxPx4/6WYCgFF
 hASoQBrD23boN2iXgezBr2fvjZfhreOyCwjoNj+/lnhzDM6Tpx2wKBr6qpJAv1xrL+vq7C9ClyM
 kK6W0aRQPt4cGofMKCuYQMoArStVPKIY4HEfJp9NUlHv0XcBkiKvM5N/AZjkFk2rGFKS7vhC+5m
 dOfnduuSAMQfOlAPhjg==
X-Proofpoint-ORIG-GUID: J2TL3hrkj8tn8T1LbhEej7RONf0gtwPI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE3MyBTYWx0ZWRfX/vlE36ZK21iW
 nRV6PmYC+Wu6Gcjqb53YoB5xTfBJyVsp8sOxjyitERoyVLCV+8EP4uvXdNGsA1Qjo9d1LM4nBqC
 0OF3TMtk/xDOYi3muuL3m26NdgNUcqs=
X-Proofpoint-GUID: J2TL3hrkj8tn8T1LbhEej7RONf0gtwPI
X-Authority-Analysis: v=2.4 cv=IYW3n2qa c=1 sm=1 tr=0 ts=6a690d66 cx=c_pps
 a=yf4wneJBeBA4fm5+j3KMTA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=amrr2-kkhvozMdUgO0QA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_05,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280173
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 28 Jul 2026 20:13:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17596

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 src/bin/convert.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/bin/convert.pl b/src/bin/convert.pl
index f8928d0..7a9ced4 100755
--- a/src/bin/convert.pl
+++ b/src/bin/convert.pl
@@ -142,7 +142,7 @@ sub convert_config
     {
         if ($lpLine =~ /meta-ti/)
         {
-            if ($lpLine =~ /(kirkstone|scarthgap|master)/)
+            if ($lpLine =~ /(kirkstone|scarthgap|wrynose|master)/)
             {
                 $loMatchBranch = 1;
             }
-- 
2.43.0


