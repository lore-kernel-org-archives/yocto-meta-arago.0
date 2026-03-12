Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CCE103E2EB
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 13:29:31 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21349.1773322168584848987
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Mar 2026 06:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=tbV0LYQ5;
 spf=pass (domain: list.ti.com, ip: 40.107.209.1, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=noqBwF88G73e3rOltogWrfgHak97jXdJNNsDDLctNdf7ZBdY3Ecv8sgy7k3Ypuxc8Ocjr1k5H8+6JkW/Y3WcJ5uvl0CaONnXR9irMztAu5YFDxfJNfWXMdfpDTlZ2PuG0DV3XC+SYM0v88cB+O8OXYPcQOsvKmGV9sS3Pdn0TSwOGplWigf7mv57H3WGnleMTrDNup16j6H4gXrKCwjOaIb9PHPXum63WaOd08N4rhJshwq4dHY0fnG7fMJlGhmeWJYyb8pEg4P6w+c3zmucc+mJIAHprIb/WpX/RxmTsu33Iqw5tgrzoXcq1qg6cww9a471lhIaff7hq0mA+9sHsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Zr18tWT1nHYGmRdwvTd/Zqi3ve0KdCcASUZy6VMepc=;
 b=wqBBo8UBqOt25FOC2LKK5GlY6awCX7QW35XgsIFxXFfGX3b/EJWgCRGlcjHVwdmCCRXbH+75UJKba2NeCn6M1mZkTPyD+zDuA0A4MjMzCtRMKg+iAcaI4b3cBl5o27wBJ12J6GOFcjBhLj8SR4muA8ruIoxaO0BMu5Edzub1E//bgGKwHaneHMNp6J5+jMubFqUS69MOMtveijGU+MckUjlJCj3NXUnDpActRyygAp2bXjxiQzGsQXwv1mNbPZAmizcTwJI26stkJeCYAmS4nWE6mRpo0+LCNrSoAIYm1k8jzwhwEzq3nCRS7VlgcWlXfkAYq/KP6o5RqBvoIvH/9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Zr18tWT1nHYGmRdwvTd/Zqi3ve0KdCcASUZy6VMepc=;
 b=tbV0LYQ55pzCCuwnxitnhNp/TJq6q7Iq+crKCLcqpXMS8bZmx1nK86sYsVrpN9MIhSQovdyNwixsuHDAeZxAF7+MqUaDGuJhsp9Yau2Kzpmeq07H1WIhmQ+WGmrg7qcfPb2x5evR4EO6x6qciz1Vl7YEhvgPVKHQcK7sS3fL5RvbCKqVrLCkfffU+6mLmrLZQMajw6WYIK1zM/azKA/u4gmWxgURzhBeCtFLHU0vZF578E0wbsO018uuPo9OtRj36NU/1HGJiZnUC+O/OVpocOrd6OkLplYLZ75ZXo4Fxv/I+SoPOgneQJ63qVImv0TtUHMA14aSbBD5eBcKsWSLAw==
Received: from BY1P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::6)
 by SN7PR10MB7031.namprd10.prod.outlook.com (2603:10b6:806:347::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 13:29:25 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::29) by BY1P220CA0017.outlook.office365.com
 (2603:10b6:a03:5c3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.28 via Frontend Transport; Thu,
 12 Mar 2026 13:29:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 13:29:25 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 08:29:24 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 08:29:24 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 08:29:24 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CDTOiY1362476;
	Thu, 12 Mar 2026 08:29:24 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 77B979ACF4; Thu, 12 Mar 2026 08:29:24 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Pratham Deshmukh <p-deshmukh@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <c-shilwant@ti.com>,
	<denys@ti.com>, <v-singh1@ti.com>
Subject: Re: [meta-arago][master][PATCH v3 0/1] nnstreamer: Fix packaging and buildpaths issues
Date: Thu, 12 Mar 2026 08:29:24 -0500
Message-ID: <20260312132924.4101448-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260312130928.889341-1-p-deshmukh@ti.com>
References: <20260312130928.889341-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|SN7PR10MB7031:EE_
X-MS-Office365-Filtering-Correlation-Id: 71409a37-8f58-4750-3b40-08de803b6121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	NkWqu+4ZBzsXyLy/IRCIzphNl2kyq/zf0z1MZENgxR5EFSH5KhkUfeIxaGEfF4e3YCJMAsUq5s7UoUFxGrGnXONuveuI9J399G3odYgemwO1/LyUhLkO8NAj+egk/HX+eCGnMaY56fAQLZ/C5c2bLHTLUlprq71ICe1oBXj8UthBsuUTP16MHvitDoDiGObncfD2S7sLu0AswpvaYxqhdB9xkAXFajBlL4covJDFrGTGOmTNbg6CGfSft/hskwZX+q2+a961wj9DsxwpsZRG5F/0z2UX+NkZqiO6SNdtHqSO5SA+OT8guHyCnMYNl6xiYeAt0JI04um9JiyIMB74NfLVomzi4Pkzt4NlQZM7kfWfSUSD19olNslngQVXUS2k8K6wQ+8QyvsyY9cbge+25HemFGd1c1d0htPz2KmgHJOXuaKpYFJTii61HXZus/zJ5rTnRzeoM5t3PRpT7KPj7+OT+0PjMIC5LKj4LISKgBXSC/UaOUKz7N0r/SDRBfI6qUgmEcNFAVIY/5yxeWS+2rp0NR6m3gihjDXvNPMhcMsNPSo1SmV/+CEq1FGxY96zrjgRfiAS+4BR8if7AJiD0m2N5pJOX4rgm9Lo8DkIsnOUH1B6lQfZkdvwA+SU+pavOMslpMAYep5Dbgk+eNn37lvWH59Av9uBXHPni+cld43NJ1qL5j+TfWU31LwD1++on/RX+kF1JmqwZhpeWsTnf7l3iZDgXypDt+I1/40iH3szSy4jNYVTzNcm/yMlUFzvwdZVQBgss0S1xPnBShqJVg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	H5RPLSkogi9C/VyVM4Biv9ye9pLlKXDJp+jWmvb/E7nhrSRAhjzWvoHohZVdvKAoik/3UCTh0axfMtRTvrxu2avehyOTFf3TvpDwwvGX1Nmp68YgmueKMm/SKQofyeuDuIGaFN4buaSDTHJf0FTVIc3Vuo/+RU/bXsDat8TTfCw6KP+7isC7iaCUG7AqtaCETQPjsQ/SnarhBmi/I9JUnPB6hTVJQrcRgWELwGGws2PYLFXyjvahzxsoQLGRme39YR6R2NilYXkyDoxH/JsK4kFoUc4iPIehGI6liw1Pr9Gz+hWhtAsdqn54rWZHmV4KxWrKd5zNe5Lhr4bFOWPjvHr1WQqyiqBhnCOIZBKSW4C110ctT2WYFZMsZ0UDhr12yfwUX1eN26LqKJX/2ea9WV3ZC2kFP/UMQtaAbTHoUmmDkFc99p9gyuoQhW8e6Qy8
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 13:29:25.2958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71409a37-8f58-4750-3b40-08de803b6121
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7031
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Mar 2026 13:29:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17317

meta-arago / na / 20260312130928.889341-1-p-deshmukh

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



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
- Patch Series: [meta-arago][master][PATCH v3 0/1] nnstreamer: Fix packagin=
g and buildpaths issues
- Submitter: From: Pratham Deshmukh <p-deshmukh@ti.com>
- Date: Date: Thu, 12 Mar 2026 18:39:27 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f20521882e93b5cfc7cb2c3c1a9cef110=
a9a0a48

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: ti-test: Add request and websocket-client to packagegroup
- Commit SHA: bf13de211888bc29ca4b2882630cb6c0135cdc8d

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
  yocto-check-layers: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ERROR: Nothing RPROVIDES 'weston-init' (but <build-dir>/sources/meta-arago/=
meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphics.bb=
 RDEPENDS on or otherwise requires it)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.
ERROR: Nothing RPROVIDES 'weston-dev' (but <build-dir>/sources/meta-arago/m=
eta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphics-sdk=
-target.bb RDEPENDS on or otherwise requires it)




