Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CD4CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 17:52:59 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5284.1780336371770305793
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 Jun 2026 10:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=f+DBD1KY;
 spf=pass (domain: ti.com, ip: 40.107.208.39, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcivujtu5r3eGhmusQGnxFrD8oMmnsb7iTY/LC8izV/Gl3MWRMitn8Eq691PklJIzoq6DD9G8Y75aJSozbmCjBh59tIOXmbTuwYrBgBm6gSzSv/i7qYjrb1NbSa0dLTB+9NIlaxokjEiDxO0whJj8GddiqJX2GzAjJJKVwu7Kvs9np0VRU1d0wrisHv72eXShgBIxl8VuIA9c/umebIjabDxoynOm0qFbUpBmaslPw3040VR3tKdLOkU+TYMSOPRKI77gS9JCY8Zyuw6Id7w4fySn4b8iVUelnxP4a6IgFjotEU4B12tlrLpspFbB4xI3ooof5AcvYJ6JVbbIIzk0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58zNK4+D7wjlO4bP8e1xB3S9JC6YXSE9OsjjUkYWA8E=;
 b=sJXvZukJYWx9LJFmDOyKmjq8RgoeQXwvjyhpWPvoZb0dhrapcBy6/OTNkMgS3TxLYxIIRdgD8t21IAFtRjXMQhO4IKJ18i/5UKcwQXidaQ8xwczgCDJXteocSRofP3eT+MIZGegYPJ3in4/tpXi+QOb5FRyg5ZUnbqkL139O+i35fG46yR6mLjPf8m2IDQwWhqKku3KoI7UhXP0HOSkyrz7fAcchsuafhfdJLpykxamBTmVDg1Hav8wGkiH4bAIJjUjyiJldI54EXQkXXQH+2IB2MTP0QobQa7pjRWcwsz8ycJWg9z5Y5rQcjJ8R1fLlCObu17g0FCtIKFROhWzjMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58zNK4+D7wjlO4bP8e1xB3S9JC6YXSE9OsjjUkYWA8E=;
 b=f+DBD1KYitCpv4fcGkCrXS4e+qFUpuTPPXXELm7/QhsccOQhdBFfyHY0nvBmkj5k2Hx3VYCq51eHFzDOmmXl3qhAg6CFc0Skg8ZTK0qNhug25iF+eMahJAZZdlhNK6oPYDrNYhV4f0p60HOSXAvyGXpbyi7/bVEwvx90zIDIz7M=
Received: from PH0PR07CA0043.namprd07.prod.outlook.com (2603:10b6:510:e::18)
 by SA2PR10MB4443.namprd10.prod.outlook.com (2603:10b6:806:11b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 17:52:47 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:510:e:cafe::af) by PH0PR07CA0043.outlook.office365.com
 (2603:10b6:510:e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.33 via Frontend Transport; Mon,
 1 Jun 2026 17:52:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Mon, 1 Jun 2026 17:52:46 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 12:52:45 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 12:52:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 1 Jun 2026 12:52:44 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 651Hqicd2101298;
	Mon, 1 Jun 2026 12:52:44 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 1 Jun 2026 12:52:44 -0500
Message-ID: <DIXWKJ46696E.2UHE9PWR3UXEP@ti.com>
From: Randolph Sapp <rs@ti.com>
To: Jonathan Cormier <jcormier@criticallink.com>,
	<meta-arago@lists.yoctoproject.org>
CC: <rs@ti.com>, <reatmon@ti.com>
Subject: Re: [meta-arago][oe-layersetup][PATCH v2] .editorconfig: Preserve
 trailing whitespace in diff and patch files
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260601172744.1191461-1-jcormier@criticallink.com>
In-Reply-To: <20260601172744.1191461-1-jcormier@criticallink.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|SA2PR10MB4443:EE_
X-MS-Office365-Filtering-Correlation-Id: 72e35516-8ee0-43e3-e0e0-08dec00696d5
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	jChPwRIXbzPGzhTNgSfo4vrVOf2ftCwhzobx+wwirHnjCD6F7CvmpZbX7Q7JFn+NH3KYoPAP4I+ZOsVgqkdS9vl5UKe+WJ70Eu9sdolpKGEtpCPN9uSiPoMq//qWSVEQJYdIogtKvwvgPqNqsV0JqLsrh70xLT+5IHkMT3vMX3GddJXOO4yWDLm4qJOBOQi064xtCqgMM4Ojahi0XUj954TsfW34kU9jfR0qDm8x0P7R8QUH1Je8LKU0pDg/JdqIQdg5m5RpaLF8+LRUUHD7ofGlcnMcWmymSFSzDHhZLnqpoRxvHcUrmnUyji3kuEFKRRZUaDmUucjaBQMWQzzCQ5kD3o1HToRyfuTvXekPWee5VSQlDjE5EOoG+zKyWEp/jd4v1FUXqEMGEVpc08QlpjQXcwl+pnhf+U7lM0TGM+IqFW9FvoBMhr81tqQKUerPTjR68fj0reWj6JGyPr9iN+QG3d+d1ceiwwl1CP6+rXTdPBLa1ouJFYci6UVupQN2aj2fYayYGnxX4VHGKi4cgauc1B5Vik3P6JWcZq5lxz/XrSnaF/BG7CeYTiv2SPCVJ/2t9k+0YFX27/cpVGW9AuCTzy8Qui0p5E4jobE+wzyPSPzsoAKSRx5Itf4R4Z91wKsiM0oKUAOTBsMllsQMYbFeiKn0dQJhzFwAI2kfdlb1cOua32CMYEi1MVha12GKchk4tzQDPM0NcfNskDtFteJI6z5Fu1FlqSPUJiEmyOU=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2Tq2QFtQMRxHopfYP0q34EYTfQSycdH9SqUgFmROHm2qkybRhpntVTsobzZn7YTJPdv4Qm01YBM8qE4oJhSgAa0K8nFWAeWML0awq2nHbUVCzsCEWhcz+1O1LDbBrZsU03Bg70ohxK+3efqgPgIAtw37War+rAB4aSk8Mye/aLYf9GeDqq7W56D/326fYZP07EXSarRtphYtMTtjONUeMt+eMvLcbMO1EwkqGr8CPxnjPwqxIAKo6DkuuZLAh1yk+ttk7o2l3uZaeh7UVXttzyLR67z//ZXDU2WFTW+FKEnSSqIEx71Cajm3eE5I7OR7opaJdIQ4hntzjG0yNnvH08L+YwYIR8/9jZLdeyFmuVeRG4ObEj75zpcSv3g/QuOBQGKc6nic1C/T9bJh/CCV8SApdB7RhdcGtDT01fkGSx9meRGjcErR5LHOjh3sWWYD
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 17:52:46.4786
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e35516-8ee0-43e3-e0e0-08dec00696d5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4443
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 Jun 2026 17:52:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17550

On Mon Jun 1, 2026 at 12:27 PM CDT, Jonathan Cormier wrote:
> Diff and patch files require trailing whitespace to denote
> empty lines with no changes.
>
> Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
> ---
>  .editorconfig | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/.editorconfig b/.editorconfig
> index 30740e726616..306d282c3164 100644
> --- a/.editorconfig
> +++ b/.editorconfig
> @@ -6,6 +6,9 @@ root =3D true
>  insert_final_newline =3D true
>  trim_trailing_whitespace =3D true
> =20
> +[*.{diff,patch}]
> +trim_trailing_whitespace =3D false
> +
>  [*.{sh,pl,xml}]
>  indent_size =3D 4
>  indent_style =3D space

Yeah, this would be picked up for any layers that don't define their own ro=
ot
editorconfig. This modification seems useful.

Reviewed-by: Randolph Sapp <rs@ti.com>

