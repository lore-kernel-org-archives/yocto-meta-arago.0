Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B466BF8D760
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 15:59:29 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18119.1776355168207549542
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 08:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=hhtQjPWR;
 spf=pass (domain: ti.com, ip: 52.101.43.5, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2NegtW7vRCpK1Su1rid9aZ7+qa7ROJwKUYcs5KUUHngjwwkI96BlZZe7E4HJ1V0rBhHa6ND9YP9OiufDSfZJL6A+ThY3L6zUbdDdk4qhukoIjo0qad5/w3rbB4UqB9C3nkP7ChdvwgnJwiVGtOYo7gYL56+H9L2nq5SaG3/EO5zHQKuhnRkbQ3qObZHLA2IDuF9b+gvzq6qXNvBhd2s3OBGj6lbebqLi0hLP4P+I6OiPH+Q9v2iyBhlD56PM3vqs1jHc+jso/quSopkVfDmTlxKhPKfrSAB+PvubTCDkM7swN0lsEfCAEhDjk0+y7WZhixaK8+owtNJnKiofyusiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AC2+nfIL0/EgwKDShOvFpvBl4+AdFtswjbQBqm65Bu4=;
 b=Fux/pVR43UoCt/B7Jx6G1SZsCYvtQ3rAwkEj9zP8i6f1R2Ce7TDhY/BE9o+taVPm5ij0VNP4J8n+tnGXUsWtaxpro74TSe912Qt8j22fUBX52/XFrdFc+B9dXwAAv+wL/xHC0XzAljBCNr68Qr/camePdNVMtxXrgTFCP0g9cnwsM5+S5ITRFGpPl/W0kBn1ZqRsidUIB/3oQ6ZxVDWDGB0WRgPVC+HN7Mxyc6owULxSWRUjU9dPamMYgiXvcOvZw5+ovgoxsYxyO/4DYq0sLUc/xEeaaF8M4pQYlf4ax8VhnmfEWaseSiK12X6SjXSf7aNuhLWr/wNqU1EKJGFvgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AC2+nfIL0/EgwKDShOvFpvBl4+AdFtswjbQBqm65Bu4=;
 b=hhtQjPWRANBUCAJBzylZP50kLi/CLGM6sF23d3LBPwGOzbp1BjdOHz4puUVkcmwKYcAJLtr1bB+6ApYF/T/CvoKqD82Pa2VI1n0VTWrYhw8EfBi8vnoFeefQCg2m1U9rUmYhUkXIxteBufaW4Ye3+YoymYOY4DQ5wlPuahT7/r4=
Received: from BL1P221CA0031.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::10)
 by CH0PR10MB4938.namprd10.prod.outlook.com (2603:10b6:610:c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Thu, 16 Apr
 2026 15:59:25 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:208:5b5:cafe::88) by BL1P221CA0031.outlook.office365.com
 (2603:10b6:208:5b5::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Thu,
 16 Apr 2026 15:59:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 15:59:24 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 10:59:24 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 10:59:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 16 Apr 2026 10:59:24 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63GFxOFG087484;
	Thu, 16 Apr 2026 10:59:24 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wDP7k-0000000AXqZ-03yM;
	Thu, 16 Apr 2026 10:59:24 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] coremark: Replace recipe with upstream version
Date: Thu, 16 Apr 2026 10:59:21 -0500
Message-ID: <20260416155923.2513376-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|CH0PR10MB4938:EE_
X-MS-Office365-Filtering-Correlation-Id: 15c60df7-b973-442c-44de-08de9bd121ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|18002099003|18096099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	BwNAo+pr7WLk2gg0MPuluV97CWp8rf+3OJL0i1GuwgZgEpHH1ZadtNRWlzt/D9bioBFFl4T6uzlzCoxkDS3QIO1LQkL+tAmXRUb7jXyYBplIQMThyZyveGjRUbQyE+W88kv3blOCzyM28v/wrIFVXMPbzB/yQ/Ak8fu8yOvi54RawlLJVYwg8rsUSDx4o401ZQpW/e5y/fTAKqK/1Ltaivr+IkI/BayG3c8TwKecvDAuo+rYoi2yZzCN8F/L2d8q4QvX0thtIsEEZw4Vv7GOeFO1JQsKGBhVbJ5DM4F2zAUQOg+gSxeJEQpAYFBYed3d7z2GVoFwhHus+x/jpCQe/P3ruT2UmzNvP2sBQmynXRFfxeUIcnKrvcP7CHsGI06g1bK4BN05gz0kXaQ5EitQr4xyFEHw+CsHWIvnuX8YhPcME5sgpmsmKKtoMsOFkV04JElM0hcehhq8nKYQEaqK6LXjW3MmFdg+le8csu5t9YW3svS6QZ8C/WsuIXBm2HySbYXwUqd8MJzW1rhNtSSugwZ+hoJ3nW8Nnl5CP0Em8/BuXxpMqJOhG0RhhvmZfkDlf3yECtv5IB1Epqi28sGXwRPznyZYs//NFxpxfQrxUl9XjsohBUgRho8AG7ylx36/nCQzlGFmeIR4XMAYAzYJxerMAPjIMs+h1EyKiFhNE6ypqhZxNd1nDwcxs9INe49H6nTtHUuWp0/zFe1yM2oD7llehbJBmFDIsGWqifvWkXA=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(18096099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bUXiCu0BzVt4Nm4IE1eYy+N5oyrFudVlD5gQqN3gEAreQEEukCGUEK8C1BoliTIOTWJI7kD57IP7TdmgRKV+sZWWMyHmk9ONh2Cm1ZwetoYPDpC765N4zf8WKfJaj9yUscKMyF4HPdPYGdnYuScsMdDAjl7abuldDwdP15C1HA/v1bgSohM0pnsS3EGMeJDO6Ugm+PT0K1f7f54VcJszkgx/jOyHemGPpqdB78+3ztjnJKo3qC/JKGmzkQzE4eP36XD6WEPWKORBdVEoxZCqczADO4JP8SrEMgrTyaOeDsQ03LEClvKNJal+Z2epakwta/5mFGn9BMWRVEFvogsgvS/drpCPIoD0hY+pby+SVuPqHth/GNib6tXmQvQTLr71mHZ6X0LR3u5YGVCluU35T5OBk7pUIvFjas+aDG+L1ak/E0caFEKJK8o+8XGmZR6J
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 15:59:24.7981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c60df7-b973-442c-44de-08de9bd121ba
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4938
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 16 Apr 2026 15:59:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17470

meta-openembedded now has a version of this recipe [1].  Convert our
recipe over to a bbappend that just adds the patch we need.

[1] https://git.openembedded.org/meta-openembedded/commit/?id=3Dd0cdd0805a1=
81ff01806ca8a3fa299f68f99aa97

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-test/licenses/Coremark             | 91 -------------------
 .../coremark/coremark-ti.inc                  |  3 +
 .../coremark/coremark_%.bbappend              |  4 +
 .../coremark/coremark_git.bb                  | 20 ----
 4 files changed, 7 insertions(+), 111 deletions(-)
 delete mode 100644 meta-arago-test/licenses/Coremark
 create mode 100644 meta-arago-test/recipes-benchmark/coremark/coremark-ti.=
inc
 create mode 100644 meta-arago-test/recipes-benchmark/coremark/coremark_%.b=
bappend
 delete mode 100644 meta-arago-test/recipes-benchmark/coremark/coremark_git=
.bb

diff --git a/meta-arago-test/licenses/Coremark b/meta-arago-test/licenses/C=
oremark
deleted file mode 100644
index c6e062f8..00000000
--- a/meta-arago-test/licenses/Coremark
+++ /dev/null
@@ -1,91 +0,0 @@
-COREMARK=C2=AE ACCEPTABLE USE AGREEMENT
-This ACCEPTABLE USE AGREEMENT (this =E2=80=9CAgreement=E2=80=9D) is offere=
d by Embedded Microprocessor Benchmark Consortium, a California nonprofit c=
orporation (=E2=80=9CLicensor=E2=80=9D), to users of its CoreMark=C2=AE sof=
tware (=E2=80=9CLicensee=E2=80=9D) exclusively on the following terms.
-
-Licensor offers benchmarking software (=E2=80=9CSoftware=E2=80=9D) pursuan=
t to an open source license, but carefully controls use of its benchmarks a=
nd their associated goodwill. Licensor has registered its trademark in one =
of the benchmarks available through the Software, COREMARK, Ser. No. 85/487=
,290; Reg. No. 4,179,307 (the =E2=80=9CTrademark=E2=80=9D), and promotes th=
e use of a standard metric as a benchmark for assessing the performance of =
embedded systems. Solely on the terms described herein, Licensee may use an=
d display the Trademark in connection with the generation of data regarding=
 measurement and analysis of computer and embedded system benchmarking via =
the Software (the =E2=80=9CLicensed Use=E2=80=9D).
-
-Article 1 =E2=80=93 License Grant.
-1.1. License. Subject to the terms and conditions of this Agreement, Licen=
sor hereby grants to Licensee, and Licensee hereby accepts from Licensor, a=
 personal, non-exclusive, royalty-free, revocable right and license to use =
and display the Trademark during the term of this Agreement (the =E2=80=9CT=
erm=E2=80=9D), solely and exclusively in connection with the Licensed Use. =
During the Term, Licensee (i) shall not modify or otherwise create derivati=
ve works of the Trademark, and (ii) may use the Trademark only to the exten=
t permitted under this License. Neither Licensee nor any affiliate or agent=
 thereof shall otherwise use the Trademark without the prior express writte=
n consent of Licensor, which may be withheld in its sole and absolute discr=
etion. All rights not expressly granted to Licensee hereunder shall remain =
the exclusive property of Licensor.
-
-1.2. Modifications to the Software. Licensee shall not use the Trademark i=
n connection with any use of a modified, derivative, or otherwise altered c=
opy of the Software.
-
-1.3. Licensor=E2=80=99s Use. Nothing in this Agreement shall preclude Lice=
nsor or any of its successors or assigns from using or permitting other ent=
ities to use the Trademark, whether or not such entity directly or indirect=
ly competes or conflicts with Licensee=E2=80=99s Licensed Use in any manner.
-
-1.4. Term and Termination. This Agreement is perpetual unless terminated b=
y either of the parties. Licensee may terminate this Agreement for convenie=
nce, without cause or liability, for any reason or for no reason whatsoever=
, upon ten (10) business days written notice. Licensor may terminate this A=
greement effective immediately upon notice of breach. Upon termination, Lic=
ensee shall immediately remove all implementations of the Trademark from th=
e Licensed Use, and delete all digitals files and records of all materials =
related to the Trademark.
-
-Article 2 =E2=80=93 Ownership.
-2.1. Ownership. Licensee acknowledges and agrees that Licensor is the owne=
r of all right, title, and interest in and to the Trademark, and all such r=
ight, title, and interest shall remain with Licensor. Licensee shall not co=
ntest, dispute, challenge, oppose, or seek to cancel Licensor=E2=80=99s rig=
ht, title, and interest in and to the Trademark. Licensee shall not prosecu=
te any application for registration of the Trademark. Licensee shall displa=
y appropriate notices regarding ownership of the Trademark in connection wi=
th the Licensed Use.
-
-2.2. Goodwill. Licensee acknowledges that Licensee shall not acquire any r=
ight, title, or interest in the Trademark by virtue of this Agreement other=
 than the license granted hereunder, and disclaims any such right, title, i=
nterest, or ownership. All goodwill and reputation generated by Licensee=E2=
=80=99s use of the Trademark shall inure to the exclusive benefit of Licens=
or. Licensee shall not by any act or omission use the Trademark in any mann=
er that disparages or reflects adversely on Licensor or its Licensed Use or=
 reputation. Licensee shall not take any action that would interfere with o=
r prejudice Licensor=E2=80=99s ownership or registration of the Trademark, =
the validity of the Trademark or the validity of the license granted by thi=
s Agreement. If Licensor determines and notifies Licensee that any act take=
n in connection with the Licensed Use (i) is inaccurate, unlawful or offens=
ive to good taste; (ii) fails to provide for proper trademark notices, or (=
iii) otherwise violates Licensee=E2=80=99s obligations under this Agreement=
, the license granted under this Agreement shall terminate.
-
-Article 3 =E2=80=93 Indemnification.
-3.1. Indemnification Generally. Licensee agrees to indemnify, defend, and =
hold harmless (collectively =E2=80=9Cindemnify=E2=80=9D or =E2=80=9Cindemni=
fication=E2=80=9D) Licensor, including Licensor=E2=80=99s members, managers=
, officers, and employees (collectively =E2=80=9CRelated Persons=E2=80=9D),=
 from and against, and pay or reimburse Licensor and such Related Persons f=
or, any and all third-party actions, claims, demands, proceedings, investig=
ations, inquiries (collectively, =E2=80=9CClaims=E2=80=9D), and any and all=
 liabilities, obligations, fines, deficiencies, costs, expenses, royalties,=
 losses, and damages (including reasonable outside counsel fees and expense=
s) associated with such Claims, to the extent that such Claim arises out of=
 (i) Licensee=E2=80=99s material breach of this Agreement, or (ii) any alle=
gation(s) that Licensee=E2=80=99s actions infringe or violate any third-par=
ty intellectual property right, including without limitation, any U.S. copy=
right, patent, or trademark, or are otherwise found to be tortious or crimi=
nal (whether or not such indemnified person is a named party in a legal pro=
ceeding).
-
-3.2. Notice and Defense of Claims. Licensor shall promptly notify Licensee=
 of any Claim for which indemnification is sought, following actual knowled=
ge of such Claim, provided however that the failure to give such notice sha=
ll not relieve Licensee of its obligations hereunder except to the extent t=
hat Licensee is materially prejudiced by such failure. In the event that an=
y third-party Claim is brought, Licensee shall have the right and option to=
 undertake and control the defense of such action with counsel of its choic=
e, provided however that (i) Licensor at its own expense may participate an=
d appear on an equal footing with Licensee in the defense of any such Claim=
, (ii) Licensor may undertake and control such defense in the event of the =
material failure of Licensee to undertake and control the same; and (iii) t=
he defense of any Claim relating to the intellectual property rights of Lic=
ensor or its licensors and any related counterclaims shall be solely contro=
lled by Licensor with counsel of its choice. Licensee shall not consent to =
judgment or concede or settle or compromise any Claim without the prior wri=
tten approval of Licensor (whose approval shall not be unreasonably withhel=
d), unless such concession or settlement or compromise includes a full and =
unconditional release of Licensor and any applicable Related Persons from a=
ll liabilities in respect of such Claim.
-
-Article 4 =E2=80=93 Miscellaneous.
-4.1. Relationship of the Parties. This Agreement does not create a partner=
ship, franchise, joint venture, agency, fiduciary, or employment relationsh=
ip between the parties.
-
-4.2. No Third-Party Beneficiaries. Except for the rights of Related Person=
s under Article 3 (Indemnification), there are no third-party beneficiaries=
 to this Agreement.
-
-4.3. Assignment. Licensee=E2=80=99s rights hereunder are non-assignable, a=
nd may not be sublicensed.
-
-4.4. Equitable Relief. Licensee acknowledges that the remedies available a=
t law for any breach of this Agreement will, by their nature, be inadequate=
. Accordingly, Licensor may obtain injunctive relief or other equitable rel=
ief to restrain a breach or threatened breach of this Agreement or to speci=
fically enforce this Agreement, without proving that any monetary damages h=
ave been sustained, and without the requirement of posting of a bond prior =
to obtaining such equitable relief.
-
-4.5. Governing Law. This Agreement will be interpreted, construed, and enf=
orced in all respects in accordance with the laws of the State of Californi=
a, without reference to its conflict of law principles.
-
-4.6. Attorneys=E2=80=99 Fees. If any legal action, arbitration or other pr=
oceeding is brought for the enforcement of this Agreement, or because of an=
 alleged dispute, breach, default, or misrepresentation in connection with =
any of the provisions of this Agreement, the successful or prevailing party=
 shall be entitled to recover its reasonable attorneys=E2=80=99 fees and ot=
her reasonable costs incurred in that action or proceeding, in addition to =
any other relief to which it may be entitled.
-
-4.7. Amendment; Waiver. This Agreement may not be amended, nor may any rig=
hts under it be waived, except in writing by Licensor.
-
-4.8. Severability. If any provision of this Agreement is held by a court o=
f competent jurisdiction to be contrary to law, the provision shall be modi=
fied by the court and interpreted so as best to accomplish the objectives o=
f the original provision to the fullest extent permitted by law, and the re=
maining provisions of this Agreement shall remain in effect.
-
-4.9. Entire Agreement. This Agreement constitutes the entire agreement bet=
ween the parties and supersedes all prior and contemporaneous agreements, p=
roposals or representations, written or oral, concerning its subject matter.
-
-Apache License
-Version 2.0, January 2004
-
-http://www.apache.org/licenses/
-
-TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION
-Definitions.
-"License" shall mean the terms and conditions for use, reproduction, and d=
istribution as defined by Sections 1 through 9 of this document.
-
-"Licensor" shall mean the copyright owner or entity authorized by the copy=
right owner that is granting the License.
-
-"Legal Entity" shall mean the union of the acting entity and all other ent=
ities that control, are controlled by, or are under common control with tha=
t entity. For the purposes of this definition, "control" means (i) the powe=
r, direct or indirect, to cause the direction or management of such entity,=
 whether by contract or otherwise, or (ii) ownership of fifty percent (50%)=
 or more of the outstanding shares, or (iii) beneficial ownership of such e=
ntity.
-
-"You" (or "Your") shall mean an individual or Legal Entity exercising perm=
issions granted by this License.
-
-"Source" form shall mean the preferred form for making modifications, incl=
uding but not limited to software source code, documentation source, and co=
nfiguration files.
-
-"Object" form shall mean any form resulting from mechanical transformation=
 or translation of a Source form, including but not limited to compiled obj=
ect code, generated documentation, and conversions to other media types.
-
-"Work" shall mean the work of authorship, whether in Source or Object form=
, made available under the License, as indicated by a copyright notice that=
 is included in or attached to the work (an example is provided in the Appe=
ndix below).
-
-"Derivative Works" shall mean any work, whether in Source or Object form, =
that is based on (or derived from) the Work and for which the editorial rev=
isions, annotations, elaborations, or other modifications represent, as a w=
hole, an original work of authorship. For the purposes of this License, Der=
ivative Works shall not include works that remain separable from, or merely=
 link (or bind by name) to the interfaces of, the Work and Derivative Works=
 thereof.
-
-"Contribution" shall mean any work of authorship, including the original v=
ersion of the Work and any modifications or additions to that Work or Deriv=
ative Works thereof, that is intentionally submitted to Licensor for inclus=
ion in the Work by the copyright owner or by an individual or Legal Entity =
authorized to submit on behalf of the copyright owner. For the purposes of =
this definition, "submitted" means any form of electronic, verbal, or writt=
en communication sent to the Licensor or its representatives, including but=
 not limited to communication on electronic mailing lists, source code cont=
rol systems, and issue tracking systems that are managed by, or on behalf o=
f, the Licensor for the purpose of discussing and improving the Work, but e=
xcluding communication that is conspicuously marked or otherwise designated=
 in writing by the copyright owner as "Not a Contribution."
-
-"Contributor" shall mean Licensor and any individual or Legal Entity on be=
half of whom a Contribution has been received by Licensor and subsequently =
incorporated within the Work.
-
-Grant of Copyright License. Subject to the terms and conditions of this Li=
cense, each Contributor hereby grants to You a perpetual, worldwide, non-ex=
clusive, no-charge, royalty-free, irrevocable copyright license to reproduc=
e, prepare Derivative Works of, publicly display, publicly perform, sublice=
nse, and distribute the Work and such Derivative Works in Source or Object =
form.
-
-Grant of Patent License. Subject to the terms and conditions of this Licen=
se, each Contributor hereby grants to You a perpetual, worldwide, non-exclu=
sive, no-charge, royalty-free, irrevocable (except as stated in this sectio=
n) patent license to make, have made, use, offer to sell, sell, import, and=
 otherwise transfer the Work, where such license applies only to those pate=
nt claims licensable by such Contributor that are necessarily infringed by =
their Contribution(s) alone or by combination of their Contribution(s) with=
 the Work to which such Contribution(s) was submitted. If You institute pat=
ent litigation against any entity (including a cross-claim or counterclaim =
in a lawsuit) alleging that the Work or a Contribution incorporated within =
the Work constitutes direct or contributory patent infringement, then any p=
atent licenses granted to You under this License for that Work shall termin=
ate as of the date such litigation is filed.
-
-Redistribution. You may reproduce and distribute copies of the Work or Der=
ivative Works thereof in any medium, with or without modifications, and in =
Source or Object form, provided that You meet the following conditions:
-
-You must give any other recipients of the Work or Derivative Works a copy =
of this License; and You must cause any modified files to carry prominent n=
otices stating that You changed the files; and You must retain, in the Sour=
ce form of any Derivative Works that You distribute, all copyright, patent,=
 trademark, and attribution notices from the Source form of the Work, exclu=
ding those notices that do not pertain to any part of the Derivative Works;=
 and If the Work includes a "NOTICE" text file as part of its distribution,=
 then any Derivative Works that You distribute must include a readable copy=
 of the attribution notices contained within such NOTICE file, excluding th=
ose notices that do not pertain to any part of the Derivative Works, in at =
least one of the following places: within a NOTICE text file distributed as=
 part of the Derivative Works; within the Source form or documentation, if =
provided along with the Derivative Works; or, within a display generated by=
 the Derivative Works, if and wherever such third-party notices normally ap=
pear. The contents of the NOTICE file are for informational purposes only a=
nd do not modify the License. You may add Your own attribution notices with=
in Derivative Works that You distribute, alongside or as an addendum to the=
 NOTICE text from the Work, provided that such additional attribution notic=
es cannot be construed as modifying the License.
-
-You may add Your own copyright statement to Your modifications and may pro=
vide additional or different license terms and conditions for use, reproduc=
tion, or distribution of Your modifications, or for any such Derivative Wor=
ks as a whole, provided Your use, reproduction, and distribution of the Wor=
k otherwise complies with the conditions stated in this License.
-
-Submission of Contributions. Unless You explicitly state otherwise, any Co=
ntribution intentionally submitted for inclusion in the Work by You to the =
Licensor shall be under the terms and conditions of this License, without a=
ny additional terms or conditions. Notwithstanding the above, nothing herei=
n shall supersede or modify the terms of any separate license agreement you=
 may have executed with Licensor regarding such Contributions.
-
-Trademarks. This License does not grant permission to use the trade names,=
 trademarks, service marks, or product names of the Licensor, except as req=
uired for reasonable and customary use in describing the origin of the Work=
 and reproducing the content of the NOTICE file.
-
-Disclaimer of Warranty. Unless required by applicable law or agreed to in =
writing, Licensor provides the Work (and each Contributor provides its Cont=
ributions) on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIN=
D, either express or implied, including, without limitation, any warranties=
 or conditions of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR =
A PARTICULAR PURPOSE. You are solely responsible for determining the approp=
riateness of using or redistributing the Work and assume any risks associat=
ed with Your exercise of permissions under this License.
-
-Limitation of Liability. In no event and under no legal theory, whether in=
 tort (including negligence), contract, or otherwise, unless required by ap=
plicable law (such as deliberate and grossly negligent acts) or agreed to i=
n writing, shall any Contributor be liable to You for damages, including an=
y direct, indirect, special, incidental, or consequential damages of any ch=
aracter arising as a result of this License or out of the use or inability =
to use the Work (including but not limited to damages for loss of goodwill,=
 work stoppage, computer failure or malfunction, or any and all other comme=
rcial damages or losses), even if such Contributor has been advised of the =
possibility of such damages.
-
-Accepting Warranty or Additional Liability. While redistributing the Work =
or Derivative Works thereof, You may choose to offer, and charge a fee for,=
 acceptance of support, warranty, indemnity, or other liability obligations=
 and/or rights consistent with this License. However, in accepting such obl=
igations, You may act only on Your own behalf and on Your sole responsibili=
ty, not on behalf of any other Contributor, and only if You agree to indemn=
ify, defend, and hold each Contributor harmless for any liability incurred =
by, or claims asserted against, such Contributor by reason of your acceptin=
g any such warranty or additional liability.
-
-END OF TERMS AND CONDITIONS
diff --git a/meta-arago-test/recipes-benchmark/coremark/coremark-ti.inc b/m=
eta-arago-test/recipes-benchmark/coremark/coremark-ti.inc
new file mode 100644
index 00000000..9a1d9b89
--- /dev/null
+++ b/meta-arago-test/recipes-benchmark/coremark/coremark-ti.inc
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/coremark:"
+
+SRC_URI +=3D "file://0001-core_main-Remove-printing-compiler-flags.patch"
diff --git a/meta-arago-test/recipes-benchmark/coremark/coremark_%.bbappend=
 b/meta-arago-test/recipes-benchmark/coremark/coremark_%.bbappend
new file mode 100644
index 00000000..952d6e99
--- /dev/null
+++ b/meta-arago-test/recipes-benchmark/coremark/coremark_%.bbappend
@@ -0,0 +1,4 @@
+COREMARK_TI =3D ""
+COREMARK_TI:ti-soc =3D "coremark-ti.inc"
+
+require ${COREMARK_TI}
diff --git a/meta-arago-test/recipes-benchmark/coremark/coremark_git.bb b/m=
eta-arago-test/recipes-benchmark/coremark/coremark_git.bb
deleted file mode 100644
index 9d770c44..00000000
--- a/meta-arago-test/recipes-benchmark/coremark/coremark_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY =3D "The benchmark utility to measure the performance of CPU"
-
-LICENSE =3D "Coremark"
-LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D0a18b17ae63deaa8a595035f668a=
ebe1"
-
-SRC_URI =3D " \
-    git://github.com/eembc/coremark.git;branch=3Dmain;protocol=3Dhttps \
-    file://0001-core_main-Remove-printing-compiler-flags.patch \
-"
-PV =3D "1.01+git"
-SRCREV =3D "1f483d5b8316753a742cbf5590caf5bd0a4e4777"
-
-do_compile() {
-    oe_runmake PORT_DIR=3Dlinux CC=3D"${CC}" XCFLAGS=3D"${CFLAGS}" LFLAGS_=
END=3D"${LDFLAGS}" compile
-}
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 ${S}/coremark.exe ${D}${bindir}/coremark
-}
--=20
2.43.0


