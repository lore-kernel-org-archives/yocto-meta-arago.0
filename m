Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF563C982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 10:31:14 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7078.1790073068978848416
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 03:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=DZFaKhkj;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=siOr5FzK;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68M647R8935711;
	Tue, 22 Sep 2026 05:31:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=pInAbGjDOfLH91PkSt3Hk5PEH6jZ5CoPQdukY5s1d
	JI=; b=DZFaKhkjaFIW3FxKNwj1XHT7n6/8aJmVku7oEsTfPVwS3OK4LQ4EY6qNE
	evDEHCdcv6DoWtANvCGrGOKdSUSVze5RULOeesSTlOf9JULw/46t/pGgp5nKlHtS
	Qo3jCB5jNCGf9/Z/Ys7HybaKzkFGzX1xBsXbGam2lK/4HHSfzxWtDRL61g3rnhFw
	8Z0wbUW6H0KFj9phoBz3AgaIdt3im8vZPaXNsqjgDmtKG7ewMioOCVmJDRJHQvjC
	Wb5WrywdzSfGgivUDBqQ7qZwcu/TmUU7nYsR4je99me0QNKY4Jgtr8BbhWofYnyy
	XFT5Lk+S3T6lODbP/aQO2Vfp5CWHw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012055.outbound.protection.outlook.com [40.93.195.55])
	by m0380145.ppops.net (PPS) with ESMTPS id 4guf4x2xky-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 05:31:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RsG72Zs/OshJMRRUf2zbFWOhrYNX/XDp21MjTSr0PMDK/gLyyYP/67lzhUHlGfuKgq2rWEsm2fsKS+LnpVcNYRafo0iSLeYkhiTBj8bcexeUTPAFus7fX3cRSjwkeSy5lYJ6tAHHpKygdN0+EhLgGfsYMYJ0VGsI0JfZBGkbVWkZOuPfS62Jy/2nsOo4H2q2w3OSGOUeqzJob9Fv939eig6Q+ES7PWOHXUz1Pc5bKX7gHHL1heC1gMX3zq4mhLzdKl3s6XMlJjEsLv3YRQhvyoskKhBZQZH8KWJnCI5zYGuNXjTg7Djj+S6iulLfLLAmxJR2q0R4O1Pzr8g3S8esEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pInAbGjDOfLH91PkSt3Hk5PEH6jZ5CoPQdukY5s1dJI=;
 b=Hmcpp2sMzjxaMuVeERHqV1I2s/GLPtEEVFKfqrynuWHAqrljz2E0UqFGANoqtPEzZAfjlv72cDOi4aLTVIhJITaxatoSEGne+OvAWBubal5hf81Hpc4X7LKktMZZ2KTb/6UwsYfwCJAbvKh2hkoRqOOUP77X3uEzEhlgQUGP7SxNFlM1b5vkPB0uXQJ69NR1p4fzwjLoaQpBU/9GYywXzcMtVEj7IKI+t3yzcfuxhDMxXSLn8SJNFFFdDwA45rJnFR4VBDz+dL/BIq50iHE5s8BhakWxWm9R2KLtxcDYriB9RbpIwFKUid63N5+2/7fWTxmpmmIENIYopKrLZLdB5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pInAbGjDOfLH91PkSt3Hk5PEH6jZ5CoPQdukY5s1dJI=;
 b=siOr5FzKfIwtgPAdL6dQG8eRq8cqpw7Z4Z5V3shMru9aoFA3vUhAjKlRYzaWekPGyjXAj3d6vykhLmfdOo2ER+dGwKILGOSBhNxECeRbxp8Zv8vBRawn1wGMRqmuwdAWEchV5j+XnNBGcMlZDRGwK0NTlSShYgjHtckBRPj4d0LbvAhUjT/o8aQHnMudWbdq3toVql50CSqZxM7kDWeVZhHmbmP/oafIzeQ5lCCxbJnsLa0aVpSVDFEb77VTtzs23afa7E/VOJjtUU1MHSNKqU9cAdYxmf6T7CROl98KDPmk2oeSse3jKBmfM5LP7de17UYm0I4/XvX5zHBa0ed0uQ==
Received: from CH0P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::24)
 by SAWPR10MB997855.namprd10.prod.outlook.com (2603:10b6:806:54d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.9; Tue, 22 Sep
 2026 10:31:04 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::ab) by CH0P220CA0022.outlook.office365.com
 (2603:10b6:610:ef::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 10:31:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 10:31:03 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 05:30:58 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 05:30:58 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 05:30:58 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MAUwai427850;
	Tue, 22 Sep 2026 05:30:58 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 931789A9C2; Tue, 22 Sep 2026 05:30:57 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <denis@denix.org>, <j-sahu@ti.com>, <p-gupta5@ti.com>,
        <r-soni@ti.com>, <reatmon@ti.com>, <s-kapoor@ti.com>, <s-sinha@ti.com>,
        <sen@ti.com>, <y-hegde@ti.com>
Subject: Re: [master/wrynose][PATCH v3 0/4] Add PipeWire audio stack
Date: Tue, 22 Sep 2026 05:30:57 -0500
Message-ID: <20260922103057.2141382-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260922102559.3717785-1-p-bhagat@ti.com>
References: <20260922102559.3717785-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|SAWPR10MB997855:EE_
X-MS-Office365-Filtering-Correlation-Id: d008e528-f6df-49e1-b8ea-08df18949abf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|56012099006|3023799007|10067099003|13003099007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	eMpNQYf+pAAMswFJ/deP1eDbpg9ywWkwdofHSEVN8mFDiLUSy1Dhd9lgtKvBynpx5QyVEXKS+NRI2di+xnA+FKXsQTz/WhQgVXUbHw6LFq2SQaiy7t9gXmxcg/o53gA+bhNhrspF3o2YI8CglM4DMh8+aQG+3hTC0r3zLpRze24VpHnbGYQ1oT38MiTD64tWj5rMrZ57CgTs7dt7Ev8b+YepZSRTCjrvNbPDLEyd7Xbia/ZdcdCk5JA6k3R9YHrhTV5cbK4j9QUX2hPZkVWe50/Musik0i2Px6gRgZjkTnYwrro3L5YWNTr42/LXxevh6Z6YwRHni58oskYd/1BDWW8jZqGa+XEiJlE5HoVUkCjJ7NrzvPt6STg65ufekjjGvmYyVGheCJuhXhfu4J1EkoiqWS0gdkKHoZO7p6LhuTvl+XOelVNB9cf2otE371T30KpyOgQe+jiR2ea6WDp1ahbkKEgGmKos+QysbUBfPaCnbbBaw1MXxzFETnU/u/8dNrcJ3Eya6r8Sp5ZNR9X7IUuQcHWTN3sGMdNtbSyJN2F4J3nI7bxDU/DSvsr9Z3C6BsUEdRDdl0XTS8dXM/151INDCWzZtYktwwFYs8Fkv2qacij4QYZcP7yWd31Pb5EaD6D2SsultimAOsO33K9Lsg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(56012099006)(3023799007)(10067099003)(13003099007)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	1rOSWvA96keZmjFX42AJsxgw5fGKdnQyPuq1rbcJMBEijPwu3R9hSySoQ94ACzB1gnfYr+hCIbOqVGQmCksUzNGOu91UDpfhuJPgzwwa+kjvpL+o0aXf4gxrQyBNmZy71t1xqz5b7eQFqW0VpRyx8x62hJQ3rcm3c0K94IoB9AT8XncroVaOqWMruQ75DnrXNv8H5LA/ejGVOdiuM/Z4M8vvG3yODHYuUwfItrd8yaNkB4GydO9aV+96XokiOFxi4qPmPria3J3xo74NWt1lZvMYhuhLz5belwB+gMWvuGyd0HJlAN8Q+lvJzWtBrdmtq7b/KybWhHJGxkx4ALWkUp8e9hPxqsk1cVYNXSFz2OjI42+xFSH65mpFUmpsROhjzeCYlTm2+vFH9ID1f2UDlz87R9vReGME9xQcGGw+1/h6ep7cTjBe9ASVEEm7xlB/
X-Exchange-RoutingPolicyChecked: 
	M6zFKmzjAOMcctODFDObbFF3hqzYs19O/SLRkAUlGxOhC41IehI9JiJi2gwYS6g7+ADzXJdYTgbeBkUbSXeQ7de4lEiQi3NCWbb99Zsia7DoohrJuWUGOQIXMSkZZzQVjxy2/lx/dtSxz8BVuehIS3baeESeOgdg1yXMyl3gtCqceTEekN7tG3MeC1P4vrF9dejklp2kE0CzM4ead0nUfsR8dNYEwdDPUiCamxrAhorQs4NOnACcFXTn73mU9pbTvuiZVsV/0MzOj0Poc4agdh/rhcbVwMnqsC+O1F1OW+rvtMCKqSyKJx8DGLpls5W2iOIQuL+YbTYk3zgpQ3YAAQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 10:31:03.9204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d008e528-f6df-49e1-b8ea-08df18949abf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR10MB997855
X-Proofpoint-ORIG-GUID: zn02CBHabJlBH_sjvgiebFhHs5cCNuv4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1MSBTYWx0ZWRfX3SL7Mr/tP4NK
 s3wCuTFAMi9Vh9gYYNYCrtqL59+que6uuow2oeDC6zpqbjd0UDw/VR0xR4GlaQHAvu/BAL+gkjP
 H9+mYTHvuFsPKgrBPkVvIGau0tRbqDHABs8vaVoOZTqVsrQOneKUixHR6nH3o2rh4z5aCj5/Zjq
 CamsZuE/fbCE9pJkDoP+GTKw5By+GW2z8czfR98d0Ko0cE/fGnCcOIBwLnT8d3ZgswSmVEkxyMq
 ewr0N9o1Y5cSw1/FaAhuIuZuw5r5RTx/Z+tIYkX3sLqRsJMA7xi0sC4Jp+lRSn1J7QDSPoXj0xP
 oTVCnRJ9+8HDp753MsrOXHa2Cj1HCt+Gp6ZFYSvuJbffSY/tNno/4UbHSBF2ffpOzDPKVY1iHQT
 KRkx/cOJ8xPFESE7+tTgebombbtafVnWMvbzaNmmrfslzDvH8VX1+0KgU/zeLZIehyVrdDbuV18
 GmdgUalxHYn0rxM1kxw==
X-Proofpoint-GUID: zn02CBHabJlBH_sjvgiebFhHs5cCNuv4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1MSBTYWx0ZWRfX8CXOd78FiIp9
 18q7wuBPjj1sGJKdSapCVJjq+pgcflWb0jSinzJtIzAKhzLK2RnFVgYVQ9p8jTZU2OXtxB45eTP
 fxsaJ+GzkShv9hhirawHqyuLao2uj1k=
X-Authority-Analysis: v=2.4 cv=XYYcX455 c=1 sm=1 tr=0 ts=6ab258eb cx=c_pps
 a=QXY2dPTpL+Q+r2h5MCHSUA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=GP7V1t1Cus2hsMToX2kA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220151
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Sep 2026 10:31:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17693

meta-arago / na / 20260922102559.3717785-1-p-bhagat

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master/wrynose][PATCH v3 1/4] packagegroup-arago-connectivity: Remove pulseaudio
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [master/wrynose][PATCH v3 2/4] recipes-multimedia: Add PipeWire bbappend and service
    WARN: Commit message does not include file/recipe name: recipes-multimedia: Add PipeWire bbappend and service. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: recipes-multimedia: Add PipeWire bbappend and service.
              recipes-multimedia (COMMIT-MESSAGE-3)
        patch
    
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [master/wrynose][PATCH v3 3/4] recipes-multimedia: Add wireplumber audio configuration
    WARN: Commit message does not include file/recipe name: recipes-multimedia: Add wireplumber audio configuration. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: recipes-multimedia: Add wireplumber audio configuration.
              recipes-multimedia (COMMIT-MESSAGE-3)
        patch
    
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [master/wrynose][PATCH v3 4/4] packagegroup-arago-connectivity: Add PipeWire audio stack
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [master/wrynose][PATCH v3 0/4] Add PipeWire audio stack
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Tue, 22 Sep 2026 15:55:55 +0530
- Num Patches: 4
- Mailing List (public inbox) Commit SHA: 95f6f4317522f5bdaba6d8c1b15e43959cee58ad

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-world: Clean up chromium inclusion
- Commit SHA: b49544b5b079db304eeefea2f4e939c557211a12

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [master/wrynose][PATCH v3 0/4] Add PipeWire audio stack
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Tue, 22 Sep 2026 15:55:55 +0530
- Num Patches: 4
- Mailing List (public inbox) Commit SHA: 95f6f4317522f5bdaba6d8c1b15e43959cee58ad

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: wrynose-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: gstreamer1.0-plugins-good: Move to 1.28.4
- Commit SHA: dc357c044e81825a503aa301d1b90eab41c1f714

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
master
=====================
FAIL
    WARN: The use of :append with other overrides needs to be manually checked. (APPEND-1)
        meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc:20
            SYSTEMD_SERVICE:${PN}:append = " wireplumber.service set-audio-defaults.service"
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887

wrynose
=====================
FAIL
    WARN: The use of :append with other overrides needs to be manually checked. (APPEND-1)
        meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc:20
            SYSTEMD_SERVICE:${PN}:append = " wireplumber.service set-audio-defaults.service"
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




