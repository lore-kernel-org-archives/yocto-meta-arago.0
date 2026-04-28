Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7539EFF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 15:09:35 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15392.1777388973987547119
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 08:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Efu8B3iZ;
 spf=pass (domain: list.ti.com, ip: 52.101.62.57, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YNlGKuZ+eid/xnJALQRVlGHvV+xYNeW79dZfFCKHGOvvujnP82aZgIMgJjNXd28+oK//PkxHCddd/3ATPX9sXsUHoNskNhMEGpd+qdhvTMmgiezGB9k+MEuZx/P7BdEiFzGo7ED+yeDfmgUhJg4uwecBBj/cpY40q3f0OlHDVvfSKMS23c9+77Jy10ZpNfBstR4bsyatV0cRrOgCYK0an7Z/NMXqF56tYiRs4ou4RRsFB0QL8jxQk0iAkPVGna2/sN1R0TzTjCHcYbcFt9zf47P5RME2DJVlqhZM9sxNNPmFQUJe4IYlZbktEFwtUIwEYY+ELt7ENRuLAKo+tVyNUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+7hIkVZLOX4/z6X0MPFX62Iy717emrQc/CZYZ9bGMg=;
 b=HYj0rFB1PFHoQj3IISW386TbBUGx5oxs3ik98kmcxmFWNRGIKD/3YvN/oFj6EB2ENMW30yWRTYw6BOGfHAafZmPouhDWHqYtSNKHeYuEI2WmyxxfOgGGJCaJMohHtCVLJ13DRRoJ8jeK93NB/ylXsibzUKM417UFqZ8TYrLXlHl1l8xxJQUg3+GxSX8NkwXiELi6UnbMTHl4zMnrb+K4veW6v8WXNwB4Q+GP8yvZ1sx2BMcBR+FSRNk/nEQKUn26r4LLUf6s0fv7CTu7dJoFCkTMR2pamu3eDRTf2eYjDLVpFeknTgGON7QerOacDwsKKT1HQ6wr3bbcyLC3QUUTOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+7hIkVZLOX4/z6X0MPFX62Iy717emrQc/CZYZ9bGMg=;
 b=Efu8B3iZ+5MXxLCxLkGVEx86QpTZf0tgM/l59mFqT06fTePxNAiEK1tRqoxgQX9FWiQs3fSq/l9kJ8Bby0QCXBnH7gOIFqck/AvS6xSKohOPUUgOqbzaT1HDIXAR6xKpXpXmkXbvnnTf1yYWDQ6bRg4HTGctu4+L7apHNwmfSQNOC/bhc5H39omrBEn6C+M6AJtndz5KPTBAbo28jpjlvyhRqbvI0PDp0GJGwrhHg+f4LykexPRN+z+NXXaxQ+846NKwUrNPQ4N9I5xM47mICX/ByMm1vi26naMjsMLsZ4m4DyPnZn9fnP0fc3jyg3Ypi5L5jgi2b/e0CvhEJKuC1Q==
Received: from SJ0PR03CA0250.namprd03.prod.outlook.com (2603:10b6:a03:3a0::15)
 by DS0PR10MB7980.namprd10.prod.outlook.com (2603:10b6:8:1b9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 15:09:29 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::31) by SJ0PR03CA0250.outlook.office365.com
 (2603:10b6:a03:3a0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.27 via Frontend Transport; Tue,
 28 Apr 2026 15:09:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 15:09:27 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 10:08:59 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 10:08:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Apr 2026 10:08:59 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63SF8xbO1191063;
	Tue, 28 Apr 2026 10:08:59 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id F39DC9ACF4; Tue, 28 Apr 2026 10:08:58 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] ltp-ddt: Fix install error
Date: Tue, 28 Apr 2026 10:08:58 -0500
Message-ID: <20260428150858.2607729-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260428144042.849713-1-reatmon@ti.com>
References: <20260428144042.849713-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|DS0PR10MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: 85a6fc86-0b1f-4865-681b-08dea5382471
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	DzhTWZYxjbNXRRlcCwcgnLBJatrXkTDaQt2HzFO8QLzPPR6vw+/4jreFPsJrBm7rLDPnUZJ7OHpt1xIRtJcccC61BiEYuCRfCbmmoMNMXWUKPulE6KoXOScXVFt4/FpRs5TAYXJZ69dE6XbgNWo0TSBH+j7HICd8H6KacQwfl5hNKEsb7eyiHdK5GQQHTz1gMfB3Hinc+/wWajPG9hIfdOIIdqYvQb5DFq7G2FzdVJlx6AOyr5mnWnwsaZSvzMo949vFz7bLDtW8DLZ1w+PZTzue7sdedTOBLgyrhNBJh8YmJBIigssPC2JVIP6Y7Pz5ic/NLOY7r12qWKlNhWKuoJRmmgQv+FHQ+n6CYLQs5zOYgvPayRLr5j6enbr7bARCV/QoE1NMx1NpIMzlSiu2R84bPOWvTnJMbiKcrsnV03NkGuCmOFFE611246cnEksjAz3ApcqDPYDgJPfZD2ux2AWFMHD+4moMxHkwOpo6FwDIwPuxm4E21JJ9jLuClm0/kP+eBBwCNOVlyrtGZS56GP8HGLnq80yb8ZvuZvjW9Zmisoox01/IbwZAc28I+/DqsIqMondenI7b0JKcTD0MjUSG2Ca8NEa6mrmFrT7R/1WqEwaxWQErNqZSO8+IM3L5mvso3+aQkQa2FhqmCqkXAzzwk9PGiNHCHq+ayvSOcNQP6yKwN3VwL8wbqCigd0dt6SqCpkM+kBDqm/aOYkqej1Tqt2Nop9IwFwE/iSaGNm4=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	dCPYPUJz1jfcCKVgugmRctiIyMkpPCDKenUL5cfTu0hRO4adW3AxWIU3woLF02Tac9Np79+7/leLf57S25GoAxELq0tFYasipW2uMcMFnaetnVreoD4kQh9lybTRfn51Y7jtFFNEBtYCHs/xddzIZ3Rg3wGXAXhDOt3LEOgcWFR2UX2Hga/J6wOkXNCfy92GySjoL1pczzrKdFCZmK1hpQB9T0w6uBTVyO8mw+1EaAWIp2WYmXDFMI/oaI2/AiCoetrhTt5UpfTZ/c51rJydPjjW37yi1odPFEnuJrAMhnYwaRUtl/rJgpA824ycbSzfMMNYqWz8pzhFppp6SSn4hPiTEJLVGocK4q7dbyruvl6FGluQf5QQZrB+DEMLpsZKRv1/7mdtybBzWvXonKBzRqvpyj65AAUHEEE1wTafZLyXrhpy/s8nkuhhSvF/boIa
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 15:09:27.9951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a6fc86-0b1f-4865-681b-08dea5382471
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7980
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 28 Apr 2026 15:09:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17501

meta-arago / na / 20260428144042.849713-1-reatmon

PRC Results: PASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
WARN - [meta-arago][master][PATCH] ltp-ddt: Fix install error
    WARN: Commit message should not include directory path to recipe: ltp-d=
dt: Fix install error.
              ltp-ddt (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH] ltp-ddt: Fix install error
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
+From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 28 Apr 2026 09:40:42 -0500
+Date: Mon, 27 Apr 2026 11:02:32 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 1b779ee9a6009d5c573183143d2faedde=
aa70051

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: qtbase: remove serial event 0 handling
- Commit SHA: 5ac854ed85c79c1756aac168dc38f78591c2cbd1

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




