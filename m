Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2955.1792532659844465913
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 20 Oct 2026 14:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=aShlfNjM;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=A/R41uBo;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKvrhF3491500;
	Tue, 20 Oct 2026 16:44:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=rqAUtaNvRBzDL0PQTj+YrU9NHf2M/JEz6tU9jpm2g
	oA=; b=aShlfNjMkfT8KChnxUwhB3GbGvWO2OAET7BU4nc4sYmXodKUadNgEJEj9
	Pa0QtnqnZTWWFjRDMhPpYusp/eausRxpf/s5ULez9zbJgqKJ1mo2ODut9KKPe+RE
	YSwVqPXYh0WyTVBjHKn1cpfKX/nJ6m62wEhjMGB727JememeStjf8Suzv4TaTXwp
	6GYsMaftxkjVrL5pWKIVRl+HlU3ZwRtizRv0GGwfDRfCDzL+lyGSEYfphWJ4zoN1
	RjDWWAuIPt6q2yQgjWhAUTjy05GtiTmhIJaVMAhLO5mHDmMV/Wg5mrBN0Ap32vZJ
	ltQirIQd0A+ostpAm+ddSpCeZwj4g==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013011.outbound.protection.outlook.com [40.107.201.11])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hecuk98b8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 16:44:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVGabTcXdxK/loN/XH/vyyLVQp73KdjTqgdZI7pbdOs2eZ77mqxjHAUZnAGg2+BPF9//oFoGYXKfpClvgGYszmVYVira8d7uuBjMMtDXm4ohey0QHm/V56bbjItnY4B1qM8MRf60fTJPpRn/HgHRFdivemi9Rcaw67LilOd/rH36GabnHUKiifuypoIzwN7XxFicCztQbahlmdPFi/8PK1VmCeOhym6QRMLs7U16uLGFtluakDyUqcC3SUOZ4IeOlcfC5/hmq/qP1QGjY/8560XXjBCWmsiRyf2vuFgxUGLzKIpm7u3TFJv+O3dLkBA8141goIyLlrkjgCBsrrjOUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqAUtaNvRBzDL0PQTj+YrU9NHf2M/JEz6tU9jpm2goA=;
 b=yMlXH1R5y7WmDUuz+gEeYu2/e7Y8ZAm+3+2mUrT+bByPT/KZHzba9CR8Kie7nYZ3u1bMzMfY1pk0Bugt1CsGMoW/VrrwEGemrwTeoJkg/bBsC6X2wg1GNAMBYMRLUnJa85DL7uZ+LdVq8bW3qlu4vJeVYadL7U+crsopSYjRkZY09tKVZj0/LOdpGhXKE7L28I8/CEAGV4PTh6D7K4fXrgCiAnHRxSSoinGgxXmxWa+PdVZzYe8EeEBhjyUwZDa5ighNpr3nMglGUXM5AAaMo6VkycGsCrQIfUo3/fqbHvR3+WxudZ8e7lBARVtSSmqeypKHF4DsPiNulux0jLUPOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqAUtaNvRBzDL0PQTj+YrU9NHf2M/JEz6tU9jpm2goA=;
 b=A/R41uBoYhgbq/cIkwDUhNGl55hc6HboZqZLf6I7uMmkQcAGjQ4H/uXRFPfvrv4KbvQK6Q/ENM7zpuZ9N9noHO6XtOpyTXInjOgOjnt4Qgfdp3vUzCbLwJ2BuG9GhIRLdjNHAf/zWL9fqP5x2bHyVNQtTUFC3CqP5pQd1aevaolcKpL+RGOq6rGgARsowoy6IuKzDl6VhUsV10LZqF2S+E6Puwy2YHfFyTZUKG9rO0J/bNeSYMDc1eJ+KQ8bs3R9zPZ2sQx65mMMN2quf7Y523utZ6mZOuvJscTTtAheZCIvLg/fbg3qNtBoF+RZ8ILtP23UQkprWKhN9xicLVrvhQ==
Received: from BN9PR03CA0146.namprd03.prod.outlook.com (2603:10b6:408:fe::31)
 by SA1PR10MB997556.namprd10.prod.outlook.com (2603:10b6:806:4b2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Tue, 20 Oct
 2026 21:44:14 +0000
Received: from LV8PEPF0000005B.namprd02.prod.outlook.com
 (2603:10b6:408:fe:cafe::10) by BN9PR03CA0146.outlook.office365.com
 (2603:10b6:408:fe::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Tue,
 20 Oct 2026 21:44:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 LV8PEPF0000005B.mail.protection.outlook.com (10.167.245.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 21:44:13 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 16:43:33 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 16:43:33 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 20 Oct 2026 16:43:33 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69KLhWeg1503798;
	Tue, 20 Oct 2026 16:43:32 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 127EB9A9C4; Tue, 20 Oct 2026 16:43:32 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] gstreamer1.0-plugins-good: Remove upstreamed patch
Date: Tue, 20 Oct 2026 16:43:31 -0500
Message-ID: <20261020214331.1520259-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261020205520.778398-1-reatmon@ti.com>
References: <20261020205520.778398-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005B:EE_|SA1PR10MB997556:EE_
X-MS-Office365-Filtering-Correlation-Id: 02e5c430-74d8-488a-c2d9-08df2ef34833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|36860700016|376014|82310400026|56012099006|260925022911599003|260925021911599003|260925021311599003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: HzVFIjAhB9xbIPxS6n+rdAlKSPidtIbK0ty7K7dO5TvfMsGe8FIKsL5582tF2RMh+YxpMC1aW65oUkdEOgpGTousl4h83glqXP4leGumWjyXez9r8pa4Xi0dHxuYfRCZWT6Vkcmo0Z+6Y8ljrA/TDN2dfTkgxpODPTXKAuNmyfCTIhcRhVldZhlE91R/HKw5J31sf6Uw3OQVssz4L2gtZti8Vyih1iQssj8sbvcUzudRmNtbfjUvrfvZSvp9G8VzKwr80knds+tiMw9YaLho982FWyes1wtn6vAKYRtqXRljbctGvFD8VdriMaFR3fccwkG55ZhPdXBNNQny3YwEJ10BkEEBCufG4RLpdRYJDIDAm7EQFxYVrjn3QLm6T+1UepeMAehg4j2lme/GnG0504ylO0CaTaDXgheKPadyXIKq9s/goHyG23Zeyj6serUPsi/yKJnAM0S2ftzontnffZRnUl+TQvrW0WqIvnWVygJdAZxfZQsIyAuHM6/7rwKwrZ3yUkA7lRUYHTxEGtAqekKmRyOUJbGCH2vTwt8mFRrH00Eb5eYHHyfQmadnxGhdBoct2j5vc1RhUz7kRsJTUoGRosc7P9vpTwXVQV2HV1UGDOqupcVvZ8Z4pIzh2pzJHwbzFRPCdf2ni2iR3qq7NMV7mMvBXJX6v8RX22pxTPgFdZde+idZm5HIDe9nevfHEhByY6O5xjBOUNxSuS5s7A==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(376014)(82310400026)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7mIxWXedT+M6IW0cVBRk7v+cwDwibfVETqU5eJhpdxrkaLMClO/ZdHKWwFO7qmQIbmZIVp0OLKI3vcB7qnUfu3Xrikh09PPHuN24EOD5jTRYahzuNV3d1ir7275rrdaDuSWrhMM5kBuDnTo1lcwA4u4Rnb2nMI1dd3m63e8FnPIP5P7okx1Xf62tz6QPPcqMLmoRHg5ExK0DoEECNcl5ORFE+0JGRPtEZ+C/m5ktQZOUnktOvUgIzOdxNIfai6AgP9WGemHY+CACLr8OaC6RewyEp5adTdfLLXAD1EJHQI7EVqAWu29autJUE2YxCkFBysog/psx6hyF6AEjtS4EOfL7q7Yp0nHjO6b36QJZpNmJ5frP1lBj/NPHbArcGnW0ahm3fVmMMd+Gi2LAHLY5c5XLaTHdcsb18sNFeCIRhfRUm0wEqFd0H/pw3GD/e7oG
X-Exchange-RoutingPolicyChecked: 3YmfTWefyXEjypfd27PAlP+yvxXRDdH5sR8N/eDchO3cEbIh5DpO2TaHe85d21efF7VbYiWkvZqLr6kleCM3UGKCyubDXs96LXMLQDHVvhAy2AxECQsBX67dWxmzmpu5Md23RFsKEvpWvbu7RgsmZkYEg3IuAiPe778OWcfwMgsZ0afiOzUQ/Z+9q3cd+sVszBoa3Mh7m335m2mWRVQwv70sRetMH/blIGfftSHCcukkOPl5oT20j73JZ0uVL6ypfWJGGqHQGG5gTYdDqJ/g62L7HAnlbo3Xb+6Pfr7wpzyF9vr9iu96iQw+OWd8vOILFSAuq3qV5CWTxqJazJDc5w==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 21:44:13.2064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e5c430-74d8-488a-c2d9-08df2ef34833
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: LV8PEPF0000005B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997556
X-Proofpoint-ORIG-GUID: WizKyA8ws-XT0jV5LxdPz562ItTl8uCy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4NiBTYWx0ZWRfX6HpqoU3QT8u6
 HAugoZNuaqPBGtGurLQS8BHoHPeLbxhKMymAQ+Iy+4ndaKxrvi0pl4h31jacDO1PMllEK9j1/8G
 qEPbMINCmQoDI2ZCP1SJPoDWgK/B2nuGLPnE7/AIR20pc4Ip7Fy5caSd4Ml2GTz2AmAZ05zt8/u
 OP9G9z4ET8M3V0+4YOzARZlLNSVlVs7RE8079xMm70ZiymAWMoS+xSVIjFak8bCb286x9jZL3Qm
 85Acu43uxQKYTRjG2eOsfTAmLRZ2rtKhVnPVl5lIMQM6RZbCIQ7QoHixvgDqoaxTw40BldyCbHt
 G4DLC2Bw6mSA9kTcjKCNgkvKRHeebT7aSmm5dKuxZ9Q3NmVuXQdOiwYEN/+8TFvLTlrEadV+x8x
 b5amPtHCYzVsQykf1/tS+Z8x0njzagJ9cUGNourw/KDL9CagAtzeHIwce9e2UWSHN1BWN2o2mny
 +KojWI+P2hsrIeoh6yA==
X-Proofpoint-GUID: WizKyA8ws-XT0jV5LxdPz562ItTl8uCy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4NiBTYWx0ZWRfXyA+Uv1YHHToB
 OVC9rb4592nFTJvWovZRgHRd5MSuootsmysiSYCC9fDuj51ttsWkx00b6o885S55pF39ktCfdR5
 S91U5XZ8RukGjlyV88epygiPyT7S72Q=
X-Authority-Analysis: v=2.4 cv=dfwVTnXe c=1 sm=1 tr=0 ts=6ad7e0b1 cx=c_pps
 a=+Z8LngAnY8uKoQL+MiJmWw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=NANd7Xxhej-OxtH05NIA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200086
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arago@lists.yoctoproject.org>; Tue, 20 Oct 2026 21:44:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17749
Content-Type: text/plain; charset="utf-8"

meta-arago / na / 20261020205520.778398-1-reatmon

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-arago][master][PATCH] gstreamer1.0-plugins-good: Remove upstreamed patch
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
-From: Brandon Brnich <b-brnich@ti.com>
- Date: Date: Tue, 20 Oct 2026 15:55:19 -0500
-Date: Wed, 18 Feb 2026 13:10:41 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f9246e5bc6e47b8431885439d8fc318c3ccd8fc2

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: gstreamer1.0-plugins-good: Remove upstreamed patch
- Commit SHA: 68d3ac973be11c86cc58ff47a052f69617536c01

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
master - PASS
=====================
All checks passed



