Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E025C5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:46:37 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3453.1787219188502049959
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Aug 2026 02:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=FnhQE9Pr;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=FOZMmBFS;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K7AsxA3544111
	for <meta-arago@lists.yoctoproject.org>; Thu, 20 Aug 2026 04:46:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ORbSZZh3nP+JpVej/L0dYuhUQUJ7aS8PJtK+JosNV
	bk=; b=FnhQE9PrkScUbLx3fY8tbajSgbzN0lviwTXrJH+2a6/4xFjxWzBX0zNr7
	AqiGUooCi1SDnTLlmk+xmopR0mfnQWGQSdiCllfe4Nf3X9PyDlT9oINJcJfnRYeC
	NABjQd/tLxhB20kUp30JW+HAVzMa5w7Rzx37yOmd9pLOOo3FZFbhM29cWcTKpQGc
	5j1Ab9djtv+9epnWIvfPekpt9FSenkRo5TKRQYEB9GlxcEbItA8F5H6TdTnVUZ7p
	+WnEMM6mTQ9+tOd9Xl+aaoN/xk83BeF6i1gEfmzlmCKi3aQv5KNOfGUTjIrCBZGe
	NomevMd4m11ttBqsS+W70f93wPssQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011032.outbound.protection.outlook.com [40.107.208.32])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g5qrkafrm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Thu, 20 Aug 2026 04:46:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pliotAe1kLKkmITzJ6R+jYgnyKNBjmYqidunANxO5E6F3T9itRBpo6KKsHsDF9NP9ou+Oh6bw+eppcqHyCtuBaKI5mnn9ujjQ2Y6Jj3YvOORvalSlbbfIEMze8MhFQVdHbLOrQIJbbWidUCBRWifqxZ0+971vDPpUAg/q8djglHYQIWV6XzqNjr+ws6ZHSvUueO2yAs3jJFDnpg4ovYBouIHgi14iiUYTtx8ou9u638sZnYHEwHAoOAtF1eFRK4pPBemZUpZ9PE5F1wFmSHJ5S/V/2TR0rigTEIpqyrQgW2KKk1CM70BUvMJPYPCsGvzGHgkM49NScuW6Gy38GrdmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORbSZZh3nP+JpVej/L0dYuhUQUJ7aS8PJtK+JosNVbk=;
 b=rka7dcLXHPR+fGlhKhY1OUlkaLgUvdG462OvMfNs/L5gqYvOpQ2dxavAkyUA6Jf1fKmK7xUVoka4T7kHybtg9OfRrIHyVqwgnunpWPawfbQaFlN8LfoLgea5EbMH65afkEsknr/SIU/H2qrpPkm8AcAVh+5/cbqUvlYXeuIVEYdBJTKQ/Zcxy3NueqwjEW7YDxjok6yFfaIJmXCTBErRyL+I/WdiIbE1ABIzhfKgCZ02MsJFhLq0xM4pR8zLHgMw0nNJVVS9QidmL+hYYuCux3TGKdW0bonFUtjOIqBX3x+RbVOnVe/2O3zcpXZlMZzQG7P29LdIVDlU9qsc5JbFnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORbSZZh3nP+JpVej/L0dYuhUQUJ7aS8PJtK+JosNVbk=;
 b=FOZMmBFS7DRhTJQjtI57MdhnKAmZa3IuKXDJVPG3JdmZy9zBSuJF1AlT3Wo8CWOeNoupR3VC+SZc9JGHz2QXr1A1rPcpmH6Q5Ld5qs+TG4yUqNArJ2ZA/fDug350surz4OkvYLGfF9ExyJlTjg8FMKGzhiFdJ6vsWCOTixSVajNitRpaFz2BjLOYxyc4A+flEfN/BlCRk3B5CykGZ8gyhvHIai3uIKpwQCyJm6lfy8EWjoa5svH3dq6x0HhZLVm52qxnBaWOyvq96vJC/BuDx0CMDbaqvxtYRGHuqSeNUyyh44zhA8kDYavnfDv2kti8f2JsTgtLkKTM1SGJxN65jA==
Received: from BN9P223CA0010.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::15)
 by LV0PR10MB997971.namprd10.prod.outlook.com (2603:10b6:408:391::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 09:46:24 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:10b:cafe::9) by BN9P223CA0010.outlook.office365.com
 (2603:10b6:408:10b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.9 via Frontend Transport; Thu, 20
 Aug 2026 09:46:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.0 via Frontend Transport; Thu, 20 Aug 2026 09:46:23 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 04:45:52 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 04:45:52 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 20 Aug 2026 04:45:52 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67K9jqH8578629;
	Thu, 20 Aug 2026 04:45:52 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 440319ACF4; Thu, 20 Aug 2026 04:45:52 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Yogesh Hegde <y-hegde@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <praneeth@ti.com>,
        <prudhvi@ti.com>
Subject: Re: [master/wrynose][PATCH] websocketd: update to main branch
Date: Thu, 20 Aug 2026 04:45:52 -0500
Message-ID: <20260820094552.2351652-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260820094117.697002-1-y-hegde@ti.com>
References: <20260820094117.697002-1-y-hegde@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|LV0PR10MB997971:EE_
X-MS-Office365-Filtering-Correlation-Id: 78844632-7fed-4bb2-3a45-08defe9fe56e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|6133799003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	xi2q/CgpPy3YRwPPMcCTRILevf51tAb1eMegCqyuZtIDsjmslQweg2E1+t6YkFBNqH/jwz7WTMmugM0gcc6Rxl5lLUuD+px64pWW9x+qQOqHmZEllbGFNxHmxQdddeqhFuh/4atAJSEaJx/ixlA2SNriOiE8/aAbXMInFSEs15b1YOzuChC59VCZN9WQrqZrMU+1h0pr/BDsVJ9NMRCDG7DXx2YND3FZ0WoJbXWJHwMH5n8+hPiL6V+Hvid00XiPFZC1PFrrd84kPLAiYzfhbceyUf+b+FzusjswIKZkTx9sd3+Y6v9gwsrWMADI7vTm7GqESfopr7ZMkQrkzuO/PWJNJ1JFClHGhqH+09zZregkbaimWLGQghDOlkof4DZjYd5ZsU9JcA8nYD9BqVx5zWQ+nyssNy1HYHo5gsaTVoOnkBQFSVr43z16jKySQt1VjeAuiBwJ3EM8QU3WbvvmjsiXELpqiynNNzuuHpEeFsPgq1yVN7ixb/OTIuwkzw3g8VOLmEm/b5SLOqWR9y+71wuf4dR1wmcKZq8fA2OxGkT4RoCN+WbZ1Ln+Dwx3sAmZzJoOYRrsqmX1KMLudTohjC+aANkIvGgUlahDh4QHd8cvLCjC3IfARCekXGubpBEw66wcJKNOlWDprekKLyiAqIc/ehNQAVc9qlKDEFFtNpP2wnn4Xi/rzp5PbewFeARMwdnr1r+cfMvkGZNMygXlKA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	P25cghEERTWfnpD8BcY5WfHIGPcpzLXpHzp0sJAznf+NE+bDlvXEcs14l3YIG5ktLG4mtaiFghZZx3Zb62PQ0cwHUYSxFUHb8F7dpnAEnsVy935g5TiTXFPS/AgiFG8RdE4Pqw5zTWQ41iL8v/MH0ufqNHK+jw9RYFGalckjbGfrC/bluwxA2CKVEcmNkZUgsj0L6f2v3rJ1QpjsSBEOCmpab9u5nZALUaJbuwwunTwvK5w9FD8c8vJE1XWzn9JhZTxlGUez7AvwAATTYJfNrh3xmMIW2ppSi0M0Vj3mV6qpxv2+2XvarBKJagtTI1h0kicjx+lfhqjj7/4iCW2iUSDG/uLnsd5DOUfSIYCFtSEzjIBWusuPbY7nGRccu6YwOHERdXeGacTdNWDqSw4IK660mjVimzgkEy7EqvDeW4rq0/jcAc1RX+otvmx3w3DX
X-Exchange-RoutingPolicyChecked: 
	r0ACvELiKdxRxDY0DYk+YgdEfjOSSs2HZvPxey1rLx4L4aMVE474fu4JxYIvvTKvx9OcCpymReosCiUBCcz9NmeBIEutrzvElmwcElELcacSG7gV769Lqtcmth8QHcab+Juo0DUZsqbMUJ8qGuSuBraJ0gRZRyVoyY+rF1oA1mfviAFm89CT2KLx1cJW7SdCJeuVY20fZz39uEBeORK3Ofn88j221uuZcVuSHnNRXOw1wDsfObR51yzIzThthf/VniiFtyaJYcMUTWxbhUWb+HOOr+7GoO3nTVfkkIkxe+sbxre6PfVTOKbhDIH016QQ8A3168ksGmKwwf3CCxbBNQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 09:46:23.4420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78844632-7fed-4bb2-3a45-08defe9fe56e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997971
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3MSBTYWx0ZWRfXx4q/fa/Ytz7Y
 skIu/GlimoN3LcvM6zH+k6Ki90gSyieybltzDATqAfTH4GeYGZhU1xGK9tmHG6DymzSUzxReteC
 82eEpUhQapdXUrqbAOMh58OvmVOFa6Brqd05l4tsHOIZtKDvGXnFG4z9cSlA7ghv9LzQMHCpM5q
 RKS3BVwx5ViUd5eSiV+PP8XQoSEHODyGX+Omu5v8I5ZZ431p+6H0wNApD9jUsI83hupGaLjQR++
 yi23IADLy3G4upW473XiK/coUmWYIa2/Apspryt6Qr5O2YICFARLEnJPOnEJ3rOJ3SDII0t+O5U
 Hde1uDEESMZaFG19uSu3XCl/AVEQz1SiBBMqgBrk97ESrVZxlfKmij3j/HKY8jZqItWj/JVPX64
 gCJc3qNnxTnh1RsDe9mrz/mSrNciQZxL3EWLVkcHppmq5uLYfSTAtbpyVG7DIu9wmBhn8I/mEuL
 3tSgBRMIgRVPDkSmSnA==
X-Proofpoint-GUID: Plww3b2ye7qdxhdhKdK2K9VDLYjjxFpb
X-Authority-Analysis: v=2.4 cv=JprBas4C c=1 sm=1 tr=0 ts=6a86ccf3 cx=c_pps
 a=3N2sgJzBBlSYHYMa9BBQhQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=9kOlOlcg6Yb2JBRFPgEA:9
X-Proofpoint-ORIG-GUID: Plww3b2ye7qdxhdhKdK2K9VDLYjjxFpb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3MSBTYWx0ZWRfX0+INt+2Q4ZR5
 38Mt5nznJeOLNKg5rta11OM4dmdCYaZuIXYiZjKEpLXf8fwPMSAlrXIIwICCioBRb/zdLn1qvCS
 WJP5BpuI/0MFnyhrWVa39VnDQcg8C/Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200071
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Aug 2026 09:46:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17604

meta-arago / na / 20260820094117.697002-1-y-hegde

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: FAIL
=========================================================
master
=====================
Summary:
- Patch Series: [master/wrynose][PATCH] websocketd: update to main branch
- Submitter: From: Yogesh Hegde <y-hegde@ti.com>
- Date: Date: Thu, 20 Aug 2026 15:11:17 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 71bb2d46dab4b680d3175368cc99a07af6f43f4b

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: meson: Fix patch for v1.11.2
- Commit SHA: 5786515d7dd3dbced3968f963d039c6bd5298bfd

Patches
----------------------------------------
FAIL - [master/wrynose][PATCH] websocketd: update to main branch
    error: patch failed: meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb:6
    error: meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb: patch does not apply
    Applying: websocketd: update to main branch
    Patch failed at 0001 websocketd: update to main branch

wrynose
=====================
Summary:
- Patch Series: [master/wrynose][PATCH] websocketd: update to main branch
- Submitter: From: Yogesh Hegde <y-hegde@ti.com>
- Date: Date: Thu, 20 Aug 2026 15:11:17 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 71bb2d46dab4b680d3175368cc99a07af6f43f4b

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: wrynose
- Commit Author: Yogesh Hegde <y-hegde@ti.com>
- Commit Subject: systemd: drop 15-eth.network and consolidate eth interfaces in 10-eth.network
- Commit SHA: 90da0eb0b9bac7501af14cc1cf1af73b76432e42

Patches
----------------------------------------
FAIL - [master/wrynose][PATCH] websocketd: update to main branch
    error: patch failed: meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb:6
    error: meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb: patch does not apply
    Applying: websocketd: update to main branch
    Patch failed at 0001 websocketd: update to main branch




