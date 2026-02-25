Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131DCFD45F6
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 21:45:46 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.59])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56900.1772055935229031211
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 13:45:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=CL2TRMMH;
 spf=pass (domain: list.ti.com, ip: 52.101.52.59, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jl5Xsh+opbfDhKBgh6G+99vC8/D9nrrK+jYAYZM7E1s1DzwfehhiV4o3HV7gjv9wUF4xSX0QDO5poELT1iCpOEAiZeYyy2NQvVjJTXwJ2NtFPBan+pZbkakocN//eZ4B7AlPLSClVXNDvEcJJDVkpoRF4f1bLjVPxMyQFPLLp3uJkCNFAQaT84dHru705H5r5jqEvFKPVado/8aH0ZUesgTkuEXSl7m6qkpExznQIGJkFPdRGqAoEdAA6uueHsQCmWhT/OEfv+XsOZ6Mu5xjwfhsp3kA7DUBCqG2N8D14yf89HqtFhmreApmeINVthFdBp91xzIqJBLrd8L72wUTvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoHloe83bwxLMHXkYYuapXuNRt0EHw9Z8uXzrwVel90=;
 b=CqGG12RwNxwH9QuPXjlaopvVuRQba2t8U452kgg7au7hW/w+HGhwFD26ttt04hqClld3ah1CHFI5b9l4xd3RqZh3N/Z/7RxrHYKaLEuX6G1fjztkbevSH2qqOcPU/Z/yFz1C9AtSkoW9STff0JffUWRNpaD4CcS3M2vbxj17HtJ8nZovvii8dcwlTKt/54ker6sHbyCQGAC65nQ1/d/qBTRynhEJq12g5FZHy7/OWLIEYwhLkXLLVd2o10Zqmx77qEkThQ6Lwb2e6mlPqA+onKfKL3SfhHSNM9zuHdLHpBbPh2jvzHufKZdAY/+xENGJqYRGQan+iL6JG756yey1Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoHloe83bwxLMHXkYYuapXuNRt0EHw9Z8uXzrwVel90=;
 b=CL2TRMMHrZ/aX13di47uBEyb9C2zvr9icn9+BL4W/eAFrnUXD6+81ZIvIqMkSyxa+dfb61APDfbCGYq6wtcXw+J29gqmxxGI9dN9reRrtIq5AuHBOuDmNu4j5G3ptEbGrktyp0LZkJK44KxcTXJbBaGneNDyNQcIvSJigJsLJhnZ7LO5Wof+jkKx6FSY6RWiRY4hLZ2Dl/keVGomR2dY7KgoIrUhk5Z0L7njP7p6eoCJ/1b/4R3pIqhhQ7cEAXhcLHRN87uF86eJCblm8r/jPtmYRrO9YWIeQCl+sDb3qySqBjUYReoR2c9gUe+LwKmGduUP1LbKbxTlB4Oo9+7U4A==
Received: from PH8P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::13)
 by CH0PR10MB4873.namprd10.prod.outlook.com (2603:10b6:610:c7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 21:45:32 +0000
Received: from MW1PEPF0001615C.namprd21.prod.outlook.com
 (2603:10b6:510:348:cafe::92) by PH8P220CA0029.outlook.office365.com
 (2603:10b6:510:348::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 21:45:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MW1PEPF0001615C.mail.protection.outlook.com (10.167.249.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Wed, 25 Feb 2026 21:45:28 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 15:45:27 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 15:45:27 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Feb 2026 15:45:27 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61PLjRBa1565463;
	Wed, 25 Feb 2026 15:45:27 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9648B9ACF4; Wed, 25 Feb 2026 15:45:27 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] kernel-selftest: Add textrel to INSANE_SKIP
Date: Wed, 25 Feb 2026 15:45:27 -0600
Message-ID: <20260225214527.3161654-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260225211731.995405-1-reatmon@ti.com>
References: <20260225211731.995405-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615C:EE_|CH0PR10MB4873:EE_
X-MS-Office365-Filtering-Correlation-Id: 9449c570-12c9-47b2-2871-08de74b7312f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|34020700016|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	hnSVGkwjJzvn3pqP0c0DgbvdxpDorBXNae4kseRkJW4R6VZeEnSO5NJ+ZVY+DsItHqMc6WkDoPQntxDXLUVdL++RzKTY4vZuqr845aw2uD8Zy7zKQOk7m8BhZvLkZ8aZP9ZRLuddOEWJr+o6PupioR76fHqP154Pzaq04/gPQVJBkaMMloO/QQhnyJoxEC/t4jbJSTbtAkClo0Ed2/8bLNq5x3uzqgFJjWEJyjNz9LCIIsKi/4slowHMaz5rSJarplor1UecGQa8cTgDxK4k//gTbXmL03v0ZMNA1OvWzZvkDULTvK86Z7M33B+jtQGOG2JkMzqwi2HpaB4ZbZ57orNLa9A+ksrTM2XY3Icj0K+8eeqdj5o1xts6Xg+xEhD1dMk+s3PFx+Xs9/XVX12vxl9GiTfKGA63zAF0TdxLbHMybwk5LdktFdcoCqOTZUQiwUZNaZevKuuAZKN7IkD3zW5fgFDES8QvKtbwrcgzgKvZUnOHiDnt2Me6r2sjPn/FE2zbq2KyUU1YOwLHfuAIz9y9pw1lOlNnhJaMzopd9zDszjmqIrM44esk3sekSDqXHrfviqm3zwyhEUxpATy0qH7cea9j2nvUuFffIwucuar//M8qT67TNxZjBEN38Ghrsw28eU3aovFe7hFZ9TCwuEC1eRasTe8IRXcxXrDUkgPgOT/MoMI1MFtxHqU9t2CqgaHKIuFpx76D71OtyKUt8UDfTFKUwlLbXZ3zRN0aZxaBjWDLnAX91gN+0N85lINY91ANTvSN0yLds5wFNKjqQzdgUe95lO03VZIJ/XQo6fDNSOPK+13//uh2DwznhqQP
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(34020700016)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	tAP4/66B5en6oFMvnl3Zr1O0hKrmuyAHkZ6Ha4+OUH9grB5cMFZ6xjEOOq3+8ctG9YOHE/bMuUgzx3Th1Z9cKeZQG5BSUQ1/lo8pkb0d+n6pbXYK9IO3omnYbIwuiA0HQ0DODaHy3zGhMlZx6607X2b98uJ0TAIBoKaGnhyg6SqzqSTHlEVYHSjTK2KffUyL8WrEupL+7HzzCYXl7wh+OsplXVJ9ZcKQJAOfmH5HicGIDMbusRJGrYFGosyV3WGIPib5QIEJe8Gf4suSqKkUNkvK3w2ct2rrQpgPsdtCW5VGH8jCNikTphgML/8nZLqCpR48KauYzeTPunBL0YQ6OFuCchcPfA69raxiuh4WPxn5C1VGMZmIW5l66MvRByYu/wUwsfgFFCZKs9NRkxfv1ABegnmbmYoDTUtK8Oa4ZyY7kUuuo6h/hNcPUo6svzXP
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 21:45:28.4174
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9449c570-12c9-47b2-2871-08de74b7312f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW1PEPF0001615C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4873
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Feb 2026 21:45:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17153

meta-arago / na / 20260225211731.995405-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] kernel-selftest: Add textrel to=
 INSANE_SKIP
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 25 Feb 2026 15:17:31 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 41c64d8bb7c783d0d5a4b03e04d39d069=
6f03f81

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: arago.conf: Remove duplicate include for yocto-space-opti=
mize.inc
- Commit SHA: a69841493f652f427ee322e394fb3a040b873193

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
ERROR: <build-dir>/sources/meta-virtualization/recipes-containers/container=
-registry/container-registry-populate.bb: QA Issue: task do_populate_regist=
ry has network enabled

ERROR: Signature change for container-registry-populate
   container-registry-populate:do_populate_registry: 83980fac77bb7807a22cc1=
a5be9b20362504127ee1bbe4a7d4deb3ff778605b4 -> ad1f952cef02fb4f8fc48c3124505=
60c35d8afdc0e30efe55af39de464dab6c8
      bitbake-diffsigs --task container-registry-populate do_populate_regis=
try --signature 83980fac77bb7807a22cc1a5be9b20362504127ee1bbe4a7d4deb3ff778=
605b4 ad1f952cef02fb4f8fc48c312450560c35d8afdc0e30efe55af39de464dab6c8
      NOTE: Reconnecting to bitbake server...
      Taint (by forced/invalidated task) changed from nostamp(uuid4):9f49a7=
b6-1ed5-4d21-8f29-736f091635c3 to nostamp(uuid4):a4b2873f-a230-4f68-abd5-93=
b8da3334ef




