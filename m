Return-Path: <s-sinha@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B302C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 08:59:33 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16923.1782809969471889593
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 01:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=NsSTlMnR;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=VE7d5VMs;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: s-sinha@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U5efYN4172259
	for <meta-arago@lists.yoctoproject.org>; Tue, 30 Jun 2026 03:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=wjseGD410F69lEq
	YmMxY2mwU2LZAanQA3vjAPyNImGc=; b=NsSTlMnR9LmkY9sauO0faWmDzDJ7Tww
	z56xc4F0FWuLLWgjvam6wfIv9WPv3TXnW6bIxqMLm4PM7eCntY5NhOL/z+nZfR11
	k5cMy0A4hKU99u0VfsaFUI0II54KkxU0sjogWriAr+ovdErX9jyIqzgCYo+Osekl
	Fl/MXP8FZWbwGKbTxE9/yqMNycTfJtdxVi3Uh8p8sA6yIjwqqXs8YXt6WCJ2xENv
	yk/JngeItgm/zpKeRYpDiH2IjxTv1mHGkjUXFDW7IWpKWfb9vJKa6E/TB24fq5Ef
	KVaXfzjpb40Zi8ZZbQJgfNSLVnGIXoC1NKraM0fg4w4wixNFyI3rR4g==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010048.outbound.protection.outlook.com [40.93.198.48])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f3qp5j042-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Tue, 30 Jun 2026 03:59:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/vJg3qeTj5AmevrZmeLotjqk8sjnzJ9T5ewjHRhdUAihdPW1Mka2nZqGWCYggCYRNFgxqT3KB1VHGGDrm08NSEuYFmPczHoLqAuRrqeU77E4rn9AUr2m0f2ipyWSCUMalqDdk2hrgYasQlhuhX8CdX5ml8yMMBj5vcqACxHqxptih4nrB48sueJZG2EcbIhU5blembqKPwFCQJ663h6zXuxq688ZgzJJ3QJpnd9DOll5rYiAT72gSQ6hXUibPXNAcHDcq4ma0/6SE6cBMSCEEmeQi93bq20P7/7csl3lrxCGWKaXiqm/sEapvact0IVzFDfofLtzgjH0/fVrgcZ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjseGD410F69lEqYmMxY2mwU2LZAanQA3vjAPyNImGc=;
 b=T8av3LxWqJIgMT7QG9oV+bnrARtl+htNp7RxSIgI8krNoRLXx/FPbVbYVZBssJuiel2nTPvDF8x0qbAcbj0sUhLPCzhcn/jHP32aBmdw7DNChpUiRSgOcqXmQkKd05zNWU70qtYpbhI7t5vhy+9ACdZvY+41AuHUmekvR0i4ridD39wiQi7DpjvmVu4DoaqIABaamzL81mumb4WwHEyiNr28W7R5I8yZoiPaCiKpCOl6EQV9tAoC9p/xFP7I373HpkXK6CKpHMIXLjXZQ0pQmAv4daoJ8hziKiSGrvZ9//Bjri2bYJbsxo8SvoSriFXr7eYUxbygHGi4P/DgGtsPvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjseGD410F69lEqYmMxY2mwU2LZAanQA3vjAPyNImGc=;
 b=VE7d5VMsXTFE5nUL6HQn3fFFflIVZ23UYCjjXKYnJI1iOwWKjG/nVXJEkrpggAL3n3TvtEdLmvgCPRmF+EKY3he8obFXbfChPXznuAsBklQg1maposTpD0jkOYtAUFmwhAc9oXSLIMCvDuCZSikqc6WcVvQUFg2GlaQRHFP5x38=
Received: from PH0PR07CA0075.namprd07.prod.outlook.com (2603:10b6:510:f::20)
 by CYYPR10MB7673.namprd10.prod.outlook.com (2603:10b6:930:cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 08:59:22 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:510:f:cafe::88) by PH0PR07CA0075.outlook.office365.com
 (2603:10b6:510:f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 08:59:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 08:59:21 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 03:59:14 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 03:59:14 -0500
Received: from DFLE207.ent.ti.com ([fe80::5dad:27a2:19e1:cb43]) by
 DFLE207.ent.ti.com ([fe80::5dad:27a2:19e1:cb43%12]) with mapi id
 15.02.2562.037; Tue, 30 Jun 2026 03:59:14 -0500
From: "Sinha, Shreyash" <s-sinha@ti.com>
To: "meta-arago@lists.yoctoproject.org" <meta-arago@lists.yoctoproject.org>,
        "Eatmon, Ryan" <reatmon@ti.com>
CC: "Kapoor, Saurabh" <s-kapoor@ti.com>, "Gupta, Puyush" <p-gupta5@ti.com>
Subject: Re: [meta-arago][oe-layersetup][PATCH] configs:
 processor-sdk-gateway: Add 11.2 release config
Thread-Topic: [meta-arago][oe-layersetup][PATCH] configs:
 processor-sdk-gateway: Add 11.2 release config
Thread-Index: AQHci662R2Xhq8IQB0WA4BA5Z5URzrZXxcxx
Date: Tue, 30 Jun 2026 08:59:14 +0000
Message-ID: <6a1d001000f84edcabf78998b27b883c@ti.com>
References: <20260122145219.149872-1-p-gupta5@ti.com>
In-Reply-To: <20260122145219.149872-1-p-gupta5@ti.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.53.176]
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: multipart/alternative;
	boundary="_000_6a1d001000f84edcabf78998b27b883cticom_"
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|CYYPR10MB7673:EE_
X-MS-Office365-Filtering-Correlation-Id: d94085b4-4580-406b-adcd-08ded685e02a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|6133799003|18002099003|22082099003|3023799007|20052099010|8096899003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	+j8tcNLKgN2PekPI8mv2eGK8eRYISyoHyCKz8N7m6Y7GPp37CmhaOhM5DbqKssP/L230P7jELDdXyVzsvvfQV+3lBd8VizXfPhjc0Pac6P1CWsOfR5Xs8V+yK/F22p/ni7c8P0C+uMaXd6wJjdAN7rMgwjqBckGCE7cZ4g6a10rhfsTZp1x81PtGTH47fPahTj/nJgUSwkyigijZ7W7azJ3mRPhWBVd8Xl5/txiDUpbUE+NTTW+rc0xw/mEPTetfuEWDf2HmtpnHXPY6iQTpK9uT/BGXZWh/bXaCDW/trhPkzpHOGwAtv4kqdZTBCuJX2oBnYPZp+m0mmONDxG4ESE/WA/DsmQpUtz8RdonsmHLDnWYtejFCpSe99WpYdfgOOssmZAR9omMrqkIjcA0TZF42a6LcifIcGpksIa6fhPf5s2N87l4llVcbunH/wIwr1SYmFOA2GmYtCYDK9FiywuwdoRNugD7122heUDPv+fHvbz0oqkeCgoM9WU+hrTx3IP0HVFGKalwxm2D2Qg1Rh5dWE/gu+WY70QCSkwUW7yYzR3FjDma0Vq/XbZ1YyL9VAyycoOs+nAur6/qZxGgTNCxdGcBDnPS4ig8jrEUeHt4lsIo3SzFpBmjl+bHFxeBfJ8Zq8dxV6CnlwnyYLSQCnZCp2H44AQPnhO0sccEXsOc=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(6133799003)(18002099003)(22082099003)(3023799007)(20052099010)(8096899003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7tvvaQa09ed8Wl2gHTif+A0O0vZPxsEHPqjJaHu9oA7bUYU3doDkaGWLW40NgUM7nYZnGinDLGKaRuNZWlgxbcEZJZvI+/1cBPjO3TqGW1QZnNNIOdXJFfw5OKsbn7cYU0etWFjg5DR7bV94zTFjxskTFHIk4He0pu3u9VCxpWs9gQtMCWB7JK7jYZbRm71GFIT5eZk5SSsaqSc5SgNUYN9jELk93hJkiQCscMEjyeSNyw00WXPjAT+hwcZz5ezUYszJQQv8p0Xs8LNKLLdFWEp+hsfNvwE62+nRhNExo4Vn8h+Oj9Kc1D18hSoJXDKl+T5hZKhfQgSKrvd1DO0gzGSUNVLkgW6VP06pmlmrZqZsEv5ibhSNIYr3uKAwK5qXunQEIIVhPoe9KN3/dHutsZi6ZvGVpSazsF6CRTS6Oem0aMYFg6KueSClA1aFHQDw
X-Exchange-RoutingPolicyChecked: 
	mlcjUGTJro7KaxNEYRv9Mj3JGtMPQI3QWSNKpm7vBoayqOR9NBbXEbtQUGv8ElxU4IyQviDLfnSdAvqjrW1qpkPZrTOI9UADhVPcGBmYfxsbpGzBWjuPKMjuptZXDUQ+Pl/ISKpx7a8gXuZcRBydvYmyL+YfY2nZXuMBdeYYBXtLDQURVyjmkO8EFK7p4yg+pSAT2kF5ByS5DemcPGVcz6a3ErvbBxzqUQjUY4DFCnspKaMG+UORyQfJfenCKCUloaS8eXjk8fRy3P5Xb+Rs+KXfd1NgnB6RFqq665Ic2xUzHQD2jr3/Mvo+MtZXySRijRBGBJu2+U9/wKey7+bhWQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 08:59:21.2782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d94085b4-4580-406b-adcd-08ded685e02a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7673
X-Proofpoint-GUID: hSZh7HOua2olo9dyjkkr-sIU3-eHesD5
X-Authority-Analysis: v=2.4 cv=ObOoyBTY c=1 sm=1 tr=0 ts=6a43856f cx=c_pps
 a=2TFapuF8m4VBt/+2R/0yYQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=xqWC_Br6kY4A:10 a=-D3XaQjUv_QA:10
 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=WNDY76dxAAAA:8 a=NEAV23lmAAAA:8
 a=SSmOFEACAAAA:8 a=CSSNf-AgkmvELht2D8sA:9 a=wPNLvfGTeEIA:10
 a=Go-Kkpme-ZVu4OuW_pIA:9 a=u0NVjAXcbTcIuAxs:21 a=frz4AuCg-hUA:10
 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=HFDSX3BADwN2sFIQuyTb:22
X-Proofpoint-ORIG-GUID: hSZh7HOua2olo9dyjkkr-sIU3-eHesD5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA3OSBTYWx0ZWRfX3SVsyrsuR/bA
 6Lf8CVlyXdBVGF1UmVWgZcfvghwPBDvXDwro+MFs1pkloLigHmSblgoxkwyrNF8IHgxwZMAOM4b
 Z5SjJuo2s7jg2r5UgUdoGDnFoE1+1OiADEW4n82MwzsqXWD64wc8f+Q1OowjW8uZQx8xQtQ2ym8
 XAjuPKY00FxWpBZ72UfWFqFEiI2HSdGOmqDHpTalMCTJ/kYwCCLapFONiIuZGFRdIuPzYZNvEpa
 ojGYQH33/OmDzGWbj8MKwBFPvgHw9wOlZJGrngy73u739spugDTIu+X2kmXha2kf/47ehpQ6+pZ
 ItM/xKZjcZYrlFG6mppmzK6bdZ2rplCOOgvjuspo07YlX5ES3j+ju2RZGqSsIDXn7OQJiH3xF7d
 /KYM0ZCsWuqYBBDsYcRZ+YsmV1677n9Ks5+FQziaORYZd63jxdyWsxaMUsyTMm9RFP401ZYTimO
 cpyDvlrpHDk8OW6B+yA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA3OSBTYWx0ZWRfX/uba7himkPN+
 A3dFjqABrda8tHN9rxMne3JogD4wG4gix4e01HBBx5C5qxx9kqohodNCvRfhrI68YoZI0iji04e
 ++9/sCh5GqZ19aq3jjna1pHfMkVpm4E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1011 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300079
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:59:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17575

--_000_6a1d001000f84edcabf78998b27b883cticom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Ryan,


This patch is long pending to be merged. Can we please do it on priority si=
nce we are already past 11.02 release.


Regards

Shreyash

________________________________
From: Gupta, Puyush
Sent: 22 January 2026 20:22:19
To: meta-arago@lists.yoctoproject.org
Cc: Eatmon, Ryan; Sinha, Shreyash
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-gateway:=
 Add 11.2 release config

Signed-off By: Puyush Gupta <p-gupta5@ti.com>
---
 ...ssor-sdk-gateway-11.02.00-config.conf.json | 158 ++++++++++++++++++
 .../processor-sdk-gateway-11.02.00-config.txt |  21 +++
 .../processor-sdk-gateway-11.02.00-config.yml |  88 ++++++++++
 .../processor-sdk-gateway-11.02.00-config.xml |  86 ++++++++++
 4 files changed, 353 insertions(+)
 create mode 100644 bitbake-setup/processor-sdk-gateway/processor-sdk-gatew=
ay-11.02.00-config.conf.json
 create mode 100644 configs/processor-sdk-gateway/processor-sdk-gateway-11.=
02.00-config.txt
 create mode 100644 kas/processor-sdk-gateway/processor-sdk-gateway-11.02.0=
0-config.yml
 create mode 100644 src/configs/processor-sdk-gateway/processor-sdk-gateway=
-11.02.00-config.xml

diff --git a/bitbake-setup/processor-sdk-gateway/processor-sdk-gateway-11.0=
2.00-config.conf.json b/bitbake-setup/processor-sdk-gateway/processor-sdk-g=
ateway-11.02.00-config.conf.json
new file mode 100644
index 0000000..71165d2
--- /dev/null
+++ b/bitbake-setup/processor-sdk-gateway/processor-sdk-gateway-11.02.00-co=
nfig.conf.json
@@ -0,0 +1,158 @@
+{
+  "version": "1.0",
+  "description": "",
+  "sources": {
+    "oe-layersetup": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git=
"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "oe-layersetup"
+    },
+    "bitbake": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/bitbake"
+          }
+        },
+        "rev": "2.8"
+      },
+      "path": "bitbake"
+    },
+    "meta-arago": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arago"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-arago"
+    },
+    "meta-qt6": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://code.qt.io/yocto/meta-qt6.git"
+          }
+        },
+        "rev": "6.9"
+      },
+      "path": "meta-qt6"
+    },
+    "meta-virtualization": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-virtualization"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-virtualization"
+    },
+    "meta-openembedded": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/meta-openembedded"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-openembedded"
+    },
+    "meta-lts-mixins": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-lts-mixins"
+          }
+        },
+        "rev": "scarthgap/rust"
+      },
+      "path": "meta-lts-mixins"
+    },
+    "meta-ti": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-ti"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-ti"
+    },
+    "meta-arm": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arm"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-arm"
+    },
+    "meta-clang": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/kraj/meta-clang"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-clang"
+    },
+    "oe-core": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/openembedded-core"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "oe-core"
+    },
+    "meta-tisdk": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-tisdk"
+    }
+  },
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-ara=
go-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","m=
eta-openembedded/meta-networking","meta-openembedded/meta-python","meta-ope=
nembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-f=
ilesystems","meta-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/=
meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-=
arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","meta-tisdk/=
meta-ti-foundational","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","mac=
hine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57=
xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-=
evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","mac=
hine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx=
-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/=
beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beaglep=
lay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/=
j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","m=
achine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j7=
84s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle=
2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
+      }
+    ]
+  }
+}
diff --git a/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.00-c=
onfig.txt b/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.00-co=
nfig.txt
new file mode 100644
index 0000000..92447af
--- /dev/null
+++ b/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.00-config.t=
xt
@@ -0,0 +1,21 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,8dcf084522b9c66a6639b5f11=
7f554fde9b6b45a
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,1640df60b0f75=
722b9e5923a5bfba3767e7d97a8,layers=3Dmeta-arago-distro:meta-arago-extras:me=
ta-arago-test
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52f=
635a31f5f9762813a8527dd31323549b7,layers=3Dmeta-chromium
+#meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,lay=
ers=3D
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,c7d71f4cece4d1fe3110c94=
5b9bd40ca82960e05,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scart=
hgap,17ac21e7d7f6f40a87618b22278b63bcfa14dbf2,layers=3D
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap=
,e76bf51a92b41d4cb185fc164ae43a863910ccd1,layers=3Dmeta-networking:meta-pyt=
hon:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rus=
t,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=3D
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,ea8c0b1cf1ab8a0b327=
e3feb1144c1ccf05b8278,layers=3Dmeta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,a81c19915b5b9e71e=
d394032e9a50fd06919e1cd,layers=3Dmeta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,5c602337ea1a80fb72=
17eeda04e396cf90587dca,layers=3D
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,H=
EAD,layers=3D.:meta-flutter-apps
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,2b3d2b671=
a149cbeea2bdc9ba42192da2015c3b7,layers=3Dmeta
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,32=
482cad2f630892b733c1457b9e9d835b098174,layers=3Dmeta-ti-foundational
+
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
+OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=3Dyes
diff --git a/kas/processor-sdk-gateway/processor-sdk-gateway-11.02.00-confi=
g.yml b/kas/processor-sdk-gateway/processor-sdk-gateway-11.02.00-config.yml
new file mode 100644
index 0000000..f08e815
--- /dev/null
+++ b/kas/processor-sdk-gateway/processor-sdk-gateway-11.02.00-config.yml
@@ -0,0 +1,88 @@
+---
+header:
+  version: 17
+  includes:
+    - ../templates/bblayers.conf.yml
+    - ../templates/local-arago64-v2.conf.yml
+
+target: tisdk-default-image
+
+repos:
+  bitbake:
+    url: "https://git.openembedded.org/bitbake"
+    branch: "2.8"
+    commit: "8dcf084522b9c66a6639b5f117f554fde9b6b45a"
+    layers:
+      .: disabled
+
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "scarthgap"
+    commit: "1640df60b0f75722b9e5923a5bfba3767e7d97a8"
+    layers:
+      meta-arago-distro:
+      meta-arago-extras:
+      meta-arago-test:
+
+  meta-qt6:
+    url: "https://code.qt.io/yocto/meta-qt6.git"
+    branch: "6.9"
+    commit: "c7d71f4cece4d1fe3110c945b9bd40ca82960e05"
+
+  meta-virtualization:
+    url: "https://git.yoctoproject.org/meta-virtualization"
+    branch: "scarthgap"
+    commit: "17ac21e7d7f6f40a87618b22278b63bcfa14dbf2"
+
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "scarthgap"
+    commit: "e76bf51a92b41d4cb185fc164ae43a863910ccd1"
+    layers:
+      meta-networking:
+      meta-python:
+      meta-oe:
+      meta-gnome:
+      meta-filesystems:
+      meta-multimedia:
+
+  meta-lts-mixins:
+    url: "https://git.yoctoproject.org/meta-lts-mixins"
+    branch: "scarthgap/rust"
+    commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+
+  meta-ti:
+    url: "https://git.yoctoproject.org/meta-ti"
+    branch: "scarthgap"
+    commit: "ea8c0b1cf1ab8a0b327e3feb1144c1ccf05b8278"
+    layers:
+      meta-ti-extras:
+      meta-beagle:
+      meta-ti-bsp:
+
+  meta-arm:
+    url: "https://git.yoctoproject.org/meta-arm"
+    branch: "scarthgap"
+    commit: "a81c19915b5b9e71ed394032e9a50fd06919e1cd"
+    layers:
+      meta-arm:
+      meta-arm-toolchain:
+
+  meta-clang:
+    url: "https://github.com/kraj/meta-clang"
+    branch: "scarthgap"
+    commit: "5c602337ea1a80fb7217eeda04e396cf90587dca"
+
+  oe-core:
+    url: "https://git.openembedded.org/openembedded-core"
+    branch: "scarthgap"
+    commit: "2b3d2b671a149cbeea2bdc9ba42192da2015c3b7"
+    layers:
+      meta:
+
+  meta-tisdk:
+    url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
+    branch: "scarthgap"
+    commit: "32482cad2f630892b733c1457b9e9d835b098174"
+    layers:
+      meta-ti-foundational:
diff --git a/src/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.=
00-config.xml b/src/configs/processor-sdk-gateway/processor-sdk-gateway-11.=
02.00-config.xml
new file mode 100644
index 0000000..23378ef
--- /dev/null
+++ b/src/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.00-conf=
ig.xml
@@ -0,0 +1,86 @@
+<?xml version=3D'1.0'?>
+<config>
+    <description></description>
+
+    <xi:include href=3D'../../common/distro_arago.xml' xmlns:xi=3D'http://=
www.w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../common/machines.xml' xmlns:xi=3D'http://www.=
w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../templates/bblayers.conf.xml' xmlns:xi=3D'htt=
p://www.w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../templates/local-arago64-v2.conf.xml' xmlns:x=
i=3D'http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.8' c=
ommit=3D'8dcf084522b9c66a6639b5f117f554fde9b6b45a'/>
+
+    <repos>
+        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'scarthgap' commit=3D'1640df60b0f75722b9e5923a5bfba3767e7d=
97a8'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'27ca52f635a31f5f9762813a8527dd3=
1323549b7' disabled=3D'true'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-selinux' url=3D'https://git.yoctoproject.org/me=
ta-selinux' branch=3D'scarthgap' commit=3D'HEAD' disabled=3D'true'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'6.9' commit=3D'c7d71f4cece4d1fe3110c945b9bd40ca82960e05'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'scarthgap' commit=3D'17ac21e7d7f6f40a87=
618b22278b63bcfa14dbf2'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'scarthgap' commit=3D'e76bf51a92b41d4cb185fc=
164ae43a863910ccd1'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-lts-mixins' url=3D'https://git.yoctoproject.org=
/meta-lts-mixins' branch=3D'scarthgap/rust' commit=3D'a8046d5ec53b1856169ac=
795aa87cb0d5db84c04'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'scarthgap' commit=3D'ea8c0b1cf1ab8a0b327e3feb1144c1ccf05b8278'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'scarthgap' commit=3D'a81c19915b5b9e71ed394032e9a50fd06919e1cd=
'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-clang' url=3D'https://github.com/kraj/meta-clan=
g' branch=3D'scarthgap' commit=3D'5c602337ea1a80fb7217eeda04e396cf90587dca'=
>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-flutter' url=3D'https://github.com/meta-flutter=
/meta-flutter.git' branch=3D'scarthgap' commit=3D'HEAD' disabled=3D'true'>
+            <layers>
+                <layer>.</layer>
+                <layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'scarthgap' commit=3D'2b3d2b671a149cbeea2bdc9ba42192da=
2015c3b7'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-tisdk' url=3D'https://git.ti.com/git/ti-sdk-lin=
ux/meta-tisdk.git' branch=3D'scarthgap' commit=3D'32482cad2f630892b733c1457=
b9e9d835b098174'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type=3D'oe-layersetup'>
+            <var name=3D'BITBAKE_INCLUSIVE_VARS' value=3D'yes'/>
+        </tool>
+    </tools>
+</config>
--
2.34.1


--_000_6a1d001000f84edcabf78998b27b883cticom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p>Hi Ryan,</p>
<p><br>
</p>
<p>This patch is long pending to be merged. Can we please do it on priority=
 since we are already past 11.02 release.</p>
<p><br>
</p>
<p>Regards</p>
<p>Shreyash</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Gupta, Puyush<br>
<b>Sent:</b> 22 January 2026 20:22:19<br>
<b>To:</b> meta-arago@lists.yoctoproject.org<br>
<b>Cc:</b> Eatmon, Ryan; Sinha, Shreyash<br>
<b>Subject:</b> [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-g=
ateway: Add 11.2 release config</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Signed-off By: Puyush Gupta &lt;p-gupta5@ti.com&gt=
;<br>
---<br>
&nbsp;...ssor-sdk-gateway-11.02.00-config.conf.json | 158 &#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<b=
r>
&nbsp;.../processor-sdk-gateway-11.02.00-config.txt |&nbsp; 21 &#43;&#43;&#=
43;<br>
&nbsp;.../processor-sdk-gateway-11.02.00-config.yml |&nbsp; 88 &#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;.../processor-sdk-gateway-11.02.00-config.xml |&nbsp; 86 &#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;4 files changed, 353 insertions(&#43;)<br>
&nbsp;create mode 100644 bitbake-setup/processor-sdk-gateway/processor-sdk-=
gateway-11.02.00-config.conf.json<br>
&nbsp;create mode 100644 configs/processor-sdk-gateway/processor-sdk-gatewa=
y-11.02.00-config.txt<br>
&nbsp;create mode 100644 kas/processor-sdk-gateway/processor-sdk-gateway-11=
.02.00-config.yml<br>
&nbsp;create mode 100644 src/configs/processor-sdk-gateway/processor-sdk-ga=
teway-11.02.00-config.xml<br>
<br>
diff --git a/bitbake-setup/processor-sdk-gateway/processor-sdk-gateway-11.0=
2.00-config.conf.json b/bitbake-setup/processor-sdk-gateway/processor-sdk-g=
ateway-11.02.00-config.conf.json<br>
new file mode 100644<br>
index 0000000..71165d2<br>
--- /dev/null<br>
&#43;&#43;&#43; b/bitbake-setup/processor-sdk-gateway/processor-sdk-gateway=
-11.02.00-config.conf.json<br>
@@ -0,0 &#43;1,158 @@<br>
&#43;{<br>
&#43;&nbsp; &quot;version&quot;: &quot;1.0&quot;,<br>
&#43;&nbsp; &quot;description&quot;: &quot;&quot;,<br>
&#43;&nbsp; &quot;sources&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;oe-layersetup&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;git-remote&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;remotes&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;origin&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;uri&quot;: &quot;<a href=3D"https://git.ti.com/git/arago-project/oe-laye=
rsetup.git">https://git.ti.com/git/arago-project/oe-layersetup.git</a>&quot=
;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rev&quot;: &quot;mast=
er&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;oe-layersetup&q=
uot;<br>
&#43;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;bitbake&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;git-remote&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;remotes&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;origin&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;uri&quot;: &quot;<a href=3D"https://git.openembedded.org/bitbake">https:=
//git.openembedded.org/bitbake</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rev&quot;: &quot;2.8&=
quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;bitbake&quot;<b=
r>
&#43;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;meta-arago&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;git-remote&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;remotes&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;origin&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;uri&quot;: &quot;<a href=3D"https://git.yoctoproject.org/meta-arago">htt=
ps://git.yoctoproject.org/meta-arago</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rev&quot;: &quot;scar=
thgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;meta-arago&quot=
;<br>
&#43;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;meta-qt6&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;git-remote&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;remotes&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;origin&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;uri&quot;: &quot;<a href=3D"https://code.qt.io/yocto/meta-qt6.git">https=
://code.qt.io/yocto/meta-qt6.git</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rev&quot;: &quot;6.9&=
quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;meta-qt6&quot;<=
br>
&#43;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;meta-virtualization&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;git-remote&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;remotes&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;origin&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;uri&quot;: &quot;<a href=3D"https://git.yoctoproject.org/meta-virtualiza=
tion">https://git.yoctoproject.org/meta-virtualization</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rev&quot;: &quot;scar=
thgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;meta-virtualiza=
tion&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;meta-openembedded&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;git-remote&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;remotes&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;origin&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;uri&quot;: &quot;<a href=3D"https://git.openembedded.org/meta-openembedd=
ed">https://git.openembedded.org/meta-openembedded</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rev&quot;: &quot;scar=
thgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;meta-openembedd=
ed&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;meta-lts-mixins&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;git-remote&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;remotes&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;origin&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;uri&quot;: &quot;<a href=3D"https://git.yoctoproject.org/meta-lts-mixins=
">https://git.yoctoproject.org/meta-lts-mixins</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rev&quot;: &quot;scar=
thgap/rust&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;meta-lts-mixins=
&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;meta-ti&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;git-remote&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;remotes&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;origin&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;uri&quot;: &quot;<a href=3D"https://git.yoctoproject.org/meta-ti">https:=
//git.yoctoproject.org/meta-ti</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rev&quot;: &quot;scar=
thgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;meta-ti&quot;<b=
r>
&#43;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;meta-arm&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;git-remote&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;remotes&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;origin&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;uri&quot;: &quot;<a href=3D"https://git.yoctoproject.org/meta-arm">https=
://git.yoctoproject.org/meta-arm</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rev&quot;: &quot;scar=
thgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;meta-arm&quot;<=
br>
&#43;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;meta-clang&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;git-remote&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;remotes&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;origin&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;uri&quot;: &quot;<a href=3D"https://github.com/kraj/meta-clang">https://=
github.com/kraj/meta-clang</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rev&quot;: &quot;scar=
thgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;meta-clang&quot=
;<br>
&#43;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;oe-core&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;git-remote&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;remotes&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;origin&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;uri&quot;: &quot;<a href=3D"https://git.openembedded.org/openembedded-co=
re">https://git.openembedded.org/openembedded-core</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rev&quot;: &quot;scar=
thgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;oe-core&quot;<b=
r>
&#43;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;meta-tisdk&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;git-remote&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;remotes&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;origin&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;uri&quot;: &quot;<a href=3D"https://git.ti.com/git/ti-sdk-linux/meta-tis=
dk.git">https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rev&quot;: &quot;scar=
thgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;meta-tisdk&quot=
;<br>
&#43;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp; },<br>
&#43;&nbsp; &quot;bitbake-setup&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;configurations&quot;: [<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;name&quot;: &quot;ara=
go&quot;,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;description&quot;: &q=
uot;TI Arago distro build&quot;,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;bb-layers&quot;: [ &q=
uot;meta-arago/meta-arago-distro&quot;,&quot;meta-arago/meta-arago-extras&q=
uot;,&quot;meta-arago/meta-arago-test&quot;,&quot;meta-qt6&quot;,&quot;meta=
-virtualization&quot;,&quot;meta-openembedded/meta-networking&quot;,&quot;m=
eta-openembedded/meta-python&quot;,&quot;meta-openembedded/meta-oe&quot;,&q=
uot;meta-openembedded/meta-gnome&quot;,&quot;meta-openembedded/meta-filesys=
tems&quot;,&quot;meta-openembedded/meta-multimedia&quot;,&quot;meta-lts-mix=
ins&quot;,&quot;meta-ti/meta-ti-extras&quot;,&quot;meta-ti/meta-beagle&quot=
;,&quot;meta-ti/meta-ti-bsp&quot;,&quot;meta-arm/meta-arm&quot;,&quot;meta-=
arm/meta-arm-toolchain&quot;,&quot;meta-clang&quot;,&quot;oe-core/meta&quot=
;,&quot;meta-tisdk/meta-ti-foundational&quot;,&quot;oe-layersetup&quot;
 ],<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;oe-fragments&quot;: [=
 &quot;oe-layersetup/localconf/local-arago64-v2&quot; ],<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;oe-fragments-one-of&q=
uot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;machine&q=
uot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;description&quot;: &quot;Available target machines&quot;,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;options&quot;: [ &quot;machine/am335x-evm&quot;,&quot;machine/am335x-hs-=
evm&quot;,&quot;machine/am437x-evm&quot;,&quot;machine/am437x-hs-evm&quot;,=
&quot;machine/am57xx-evm&quot;,&quot;machine/am57xx-hs-evm&quot;,&quot;mach=
ine/am62xx-evm&quot;,&quot;machine/am62xx-lp-evm&quot;,&quot;machine/am62xx=
sip-evm&quot;,&quot;machine/am62axx-evm&quot;,&quot;machine/am62dxx-evm&quo=
t;,&quot;machine/am62lxx-evm&quot;,&quot;machine/am62pxx-evm&quot;,&quot;ma=
chine/am64xx-evm&quot;,&quot;machine/am65xx-evm&quot;,&quot;machine/am65xx-=
hs-evm&quot;,&quot;machine/am68-sk&quot;,&quot;machine/am69-sk&quot;,&quot;=
machine/beagle-x15&quot;,&quot;machine/beaglebone&quot;,&quot;machine/beagl=
ebone-ai64&quot;,&quot;machine/beagleplay&quot;,&quot;machine/beagleplay-ti=
&quot;,&quot;machine/beagley-ai&quot;,&quot;machine/j7-evm&quot;,&quot;mach=
ine/j7-hs-evm&quot;,&quot;machine/j721e-evm&quot;,&quot;machine/j721e-sk&qu=
ot;,&quot;machine/j7200-evm&quot;,&quot;machine/j7200-hs-evm&quot;,&quot;ma=
chine/j721s2-evm&quot;,&quot;machine/j721s2-hs-evm&quot;,&quot;machine/j742=
s2-evm&quot;,&quot;machine/j784s4-evm&quot;,&quot;machine/j784s4-hs-evm&quo=
t;,&quot;machine/j722s-evm&quot;,&quot;machine/pocketbeagle2&quot;
 ]<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;distro&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;description&quot;: &quot;Available distributions&quot;,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;options&quot;: [ &quot;distro/arago&quot; ]<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp; ]<br>
&#43;&nbsp; }<br>
&#43;}<br>
diff --git a/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.00-c=
onfig.txt b/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.00-co=
nfig.txt<br>
new file mode 100644<br>
index 0000000..92447af<br>
--- /dev/null<br>
&#43;&#43;&#43; b/configs/processor-sdk-gateway/processor-sdk-gateway-11.02=
.00-config.txt<br>
@@ -0,0 &#43;1,21 @@<br>
&#43;# This file takes repo entries in the format<br>
&#43;# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2..=
.:layern]<br>
&#43;<br>
&#43;bitbake,https://git.openembedded.org/bitbake,2.8,8dcf084522b9c66a6639b=
5f117f554fde9b6b45a<br>
&#43;meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,1640df60b=
0f75722b9e5923a5bfba3767e7d97a8,layers=3Dmeta-arago-distro:meta-arago-extra=
s:meta-arago-test<br>
&#43;#meta-browser,https://github.com/OSSystems/meta-browser.git,master,27c=
a52f635a31f5f9762813a8527dd31323549b7,layers=3Dmeta-chromium<br>
&#43;#meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD=
,layers=3D<br>
&#43;meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,c7d71f4cece4d1fe311=
0c945b9bd40ca82960e05,layers=3D<br>
&#43;meta-virtualization,https://git.yoctoproject.org/meta-virtualization,s=
carthgap,17ac21e7d7f6f40a87618b22278b63bcfa14dbf2,layers=3D<br>
&#43;meta-openembedded,https://git.openembedded.org/meta-openembedded,scart=
hgap,e76bf51a92b41d4cb185fc164ae43a863910ccd1,layers=3Dmeta-networking:meta=
-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia<br>
&#43;meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap=
/rust,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=3D<br>
&#43;meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,ea8c0b1cf1ab8a0=
b327e3feb1144c1ccf05b8278,layers=3Dmeta-ti-extras:meta-beagle:meta-ti-bsp<b=
r>
&#43;meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,a81c19915b5b9=
e71ed394032e9a50fd06919e1cd,layers=3Dmeta-arm:meta-arm-toolchain<br>
&#43;meta-clang,https://github.com/kraj/meta-clang,scarthgap,5c602337ea1a80=
fb7217eeda04e396cf90587dca,layers=3D<br>
&#43;#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthg=
ap,HEAD,layers=3D.:meta-flutter-apps<br>
&#43;oe-core,https://git.openembedded.org/openembedded-core,scarthgap,2b3d2=
b671a149cbeea2bdc9ba42192da2015c3b7,layers=3Dmeta<br>
&#43;meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthga=
p,32482cad2f630892b733c1457b9e9d835b098174,layers=3Dmeta-ti-foundational<br=
>
&#43;<br>
&#43;OECORELAYERCONF=3D./sample-files/bblayers.conf.sample<br>
&#43;OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample<br>
&#43;BITBAKE_INCLUSIVE_VARS=3Dyes<br>
diff --git a/kas/processor-sdk-gateway/processor-sdk-gateway-11.02.00-confi=
g.yml b/kas/processor-sdk-gateway/processor-sdk-gateway-11.02.00-config.yml=
<br>
new file mode 100644<br>
index 0000000..f08e815<br>
--- /dev/null<br>
&#43;&#43;&#43; b/kas/processor-sdk-gateway/processor-sdk-gateway-11.02.00-=
config.yml<br>
@@ -0,0 &#43;1,88 @@<br>
&#43;---<br>
&#43;header:<br>
&#43;&nbsp; version: 17<br>
&#43;&nbsp; includes:<br>
&#43;&nbsp;&nbsp;&nbsp; - ../templates/bblayers.conf.yml<br>
&#43;&nbsp;&nbsp;&nbsp; - ../templates/local-arago64-v2.conf.yml<br>
&#43;<br>
&#43;target: tisdk-default-image<br>
&#43;<br>
&#43;repos:<br>
&#43;&nbsp; bitbake:<br>
&#43;&nbsp;&nbsp;&nbsp; url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake">https://git.openembedded.org/bitbake</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; branch: &quot;2.8&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; commit: &quot;8dcf084522b9c66a6639b5f117f554fde9b6b=
45a&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; layers:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .: disabled<br>
&#43;<br>
&#43;&nbsp; meta-arago:<br>
&#43;&nbsp;&nbsp;&nbsp; url: &quot;<a href=3D"https://git.yoctoproject.org/=
meta-arago">https://git.yoctoproject.org/meta-arago</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; branch: &quot;scarthgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; commit: &quot;1640df60b0f75722b9e5923a5bfba3767e7d9=
7a8&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; layers:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-arago-distro:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-arago-extras:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-arago-test:<br>
&#43;<br>
&#43;&nbsp; meta-qt6:<br>
&#43;&nbsp;&nbsp;&nbsp; url: &quot;<a href=3D"https://code.qt.io/yocto/meta=
-qt6.git">https://code.qt.io/yocto/meta-qt6.git</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; branch: &quot;6.9&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; commit: &quot;c7d71f4cece4d1fe3110c945b9bd40ca82960=
e05&quot;<br>
&#43;<br>
&#43;&nbsp; meta-virtualization:<br>
&#43;&nbsp;&nbsp;&nbsp; url: &quot;<a href=3D"https://git.yoctoproject.org/=
meta-virtualization">https://git.yoctoproject.org/meta-virtualization</a>&q=
uot;<br>
&#43;&nbsp;&nbsp;&nbsp; branch: &quot;scarthgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; commit: &quot;17ac21e7d7f6f40a87618b22278b63bcfa14d=
bf2&quot;<br>
&#43;<br>
&#43;&nbsp; meta-openembedded:<br>
&#43;&nbsp;&nbsp;&nbsp; url: &quot;<a href=3D"https://git.openembedded.org/=
meta-openembedded">https://git.openembedded.org/meta-openembedded</a>&quot;=
<br>
&#43;&nbsp;&nbsp;&nbsp; branch: &quot;scarthgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; commit: &quot;e76bf51a92b41d4cb185fc164ae43a863910c=
cd1&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; layers:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-networking:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-python:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-oe:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-gnome:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-filesystems:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-multimedia:<br>
&#43;<br>
&#43;&nbsp; meta-lts-mixins:<br>
&#43;&nbsp;&nbsp;&nbsp; url: &quot;<a href=3D"https://git.yoctoproject.org/=
meta-lts-mixins">https://git.yoctoproject.org/meta-lts-mixins</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; branch: &quot;scarthgap/rust&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; commit: &quot;a8046d5ec53b1856169ac795aa87cb0d5db84=
c04&quot;<br>
&#43;<br>
&#43;&nbsp; meta-ti:<br>
&#43;&nbsp;&nbsp;&nbsp; url: &quot;<a href=3D"https://git.yoctoproject.org/=
meta-ti">https://git.yoctoproject.org/meta-ti</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; branch: &quot;scarthgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; commit: &quot;ea8c0b1cf1ab8a0b327e3feb1144c1ccf05b8=
278&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; layers:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-ti-extras:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-beagle:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-ti-bsp:<br>
&#43;<br>
&#43;&nbsp; meta-arm:<br>
&#43;&nbsp;&nbsp;&nbsp; url: &quot;<a href=3D"https://git.yoctoproject.org/=
meta-arm">https://git.yoctoproject.org/meta-arm</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; branch: &quot;scarthgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; commit: &quot;a81c19915b5b9e71ed394032e9a50fd06919e=
1cd&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; layers:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-arm:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-arm-toolchain:<br>
&#43;<br>
&#43;&nbsp; meta-clang:<br>
&#43;&nbsp;&nbsp;&nbsp; url: &quot;<a href=3D"https://github.com/kraj/meta-=
clang">https://github.com/kraj/meta-clang</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; branch: &quot;scarthgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; commit: &quot;5c602337ea1a80fb7217eeda04e396cf90587=
dca&quot;<br>
&#43;<br>
&#43;&nbsp; oe-core:<br>
&#43;&nbsp;&nbsp;&nbsp; url: &quot;<a href=3D"https://git.openembedded.org/=
openembedded-core">https://git.openembedded.org/openembedded-core</a>&quot;=
<br>
&#43;&nbsp;&nbsp;&nbsp; branch: &quot;scarthgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; commit: &quot;2b3d2b671a149cbeea2bdc9ba42192da2015c=
3b7&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; layers:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta:<br>
&#43;<br>
&#43;&nbsp; meta-tisdk:<br>
&#43;&nbsp;&nbsp;&nbsp; url: &quot;<a href=3D"https://git.ti.com/git/ti-sdk=
-linux/meta-tisdk.git">https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git</=
a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; branch: &quot;scarthgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; commit: &quot;32482cad2f630892b733c1457b9e9d835b098=
174&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; layers:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-ti-foundational:<br>
diff --git a/src/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.=
00-config.xml b/src/configs/processor-sdk-gateway/processor-sdk-gateway-11.=
02.00-config.xml<br>
new file mode 100644<br>
index 0000000..23378ef<br>
--- /dev/null<br>
&#43;&#43;&#43; b/src/configs/processor-sdk-gateway/processor-sdk-gateway-1=
1.02.00-config.xml<br>
@@ -0,0 &#43;1,86 @@<br>
&#43;&lt;?xml version=3D'1.0'?&gt;<br>
&#43;&lt;config&gt;<br>
&#43;&nbsp;&nbsp;&nbsp; &lt;description&gt;&lt;/description&gt;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp; &lt;xi:include href=3D'../../common/distro_arago.xm=
l' xmlns:xi=3D'<a href=3D"http://www.w3.org/2001/XInclude'/">http://www.w3.=
org/2001/XInclude'/</a>&gt;<br>
&#43;&nbsp;&nbsp;&nbsp; &lt;xi:include href=3D'../../common/machines.xml' x=
mlns:xi=3D'<a href=3D"http://www.w3.org/2001/XInclude'/">http://www.w3.org/=
2001/XInclude'/</a>&gt;<br>
&#43;&nbsp;&nbsp;&nbsp; &lt;xi:include href=3D'../../templates/bblayers.con=
f.xml' xmlns:xi=3D'<a href=3D"http://www.w3.org/2001/XInclude'/">http://www=
.w3.org/2001/XInclude'/</a>&gt;<br>
&#43;&nbsp;&nbsp;&nbsp; &lt;xi:include href=3D'../../templates/local-arago6=
4-v2.conf.xml' xmlns:xi=3D'<a href=3D"http://www.w3.org/2001/XInclude'/">ht=
tp://www.w3.org/2001/XInclude'/</a>&gt;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp; &lt;bitbake url=3D'<a href=3D"https://git.openembed=
ded.org/bitbake">https://git.openembedded.org/bitbake</a>' branch=3D'2.8' c=
ommit=3D'8dcf084522b9c66a6639b5f117f554fde9b6b45a'/&gt;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp; &lt;repos&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'meta-arago=
' url=3D'<a href=3D"https://git.yoctoproject.org/meta-arago">https://git.yo=
ctoproject.org/meta-arago</a>' branch=3D'scarthgap' commit=3D'1640df60b0f75=
722b9e5923a5bfba3767e7d97a8'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-arago-distro&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-arago-extras&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-arago-test&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;/layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'meta-brows=
er' url=3D'<a href=3D"https://github.com/OSSystems/meta-browser.git">https:=
//github.com/OSSystems/meta-browser.git</a>' branch=3D'master' commit=3D'27=
ca52f635a31f5f9762813a8527dd31323549b7' disabled=3D'true'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-chromium&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;/layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'meta-selin=
ux' url=3D'<a href=3D"https://git.yoctoproject.org/meta-selinux">https://gi=
t.yoctoproject.org/meta-selinux</a>' branch=3D'scarthgap' commit=3D'HEAD' d=
isabled=3D'true'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers/&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'meta-qt6' =
url=3D'<a href=3D"https://code.qt.io/yocto/meta-qt6.git">https://code.qt.io=
/yocto/meta-qt6.git</a>' branch=3D'6.9' commit=3D'c7d71f4cece4d1fe3110c945b=
9bd40ca82960e05'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers/&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'meta-virtu=
alization' url=3D'<a href=3D"https://git.yoctoproject.org/meta-virtualizati=
on">https://git.yoctoproject.org/meta-virtualization</a>' branch=3D'scarthg=
ap' commit=3D'17ac21e7d7f6f40a87618b22278b63bcfa14dbf2'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers/&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'meta-opene=
mbedded' url=3D'<a href=3D"https://git.openembedded.org/meta-openembedded">=
https://git.openembedded.org/meta-openembedded</a>' branch=3D'scarthgap' co=
mmit=3D'e76bf51a92b41d4cb185fc164ae43a863910ccd1'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-networking&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-python&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-oe&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-gnome&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-filesystems&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-multimedia&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;/layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'meta-lts-m=
ixins' url=3D'<a href=3D"https://git.yoctoproject.org/meta-lts-mixins">http=
s://git.yoctoproject.org/meta-lts-mixins</a>' branch=3D'scarthgap/rust' com=
mit=3D'a8046d5ec53b1856169ac795aa87cb0d5db84c04'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers/&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'meta-ti' u=
rl=3D'<a href=3D"https://git.yoctoproject.org/meta-ti">https://git.yoctopro=
ject.org/meta-ti</a>' branch=3D'scarthgap' commit=3D'ea8c0b1cf1ab8a0b327e3f=
eb1144c1ccf05b8278'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-ti-extras&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-beagle&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-ti-bsp&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;/layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'meta-arm' =
url=3D'<a href=3D"https://git.yoctoproject.org/meta-arm">https://git.yoctop=
roject.org/meta-arm</a>' branch=3D'scarthgap' commit=3D'a81c19915b5b9e71ed3=
94032e9a50fd06919e1cd'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-arm&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-arm-toolchain&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;/layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'meta-clang=
' url=3D'<a href=3D"https://github.com/kraj/meta-clang">https://github.com/=
kraj/meta-clang</a>' branch=3D'scarthgap' commit=3D'5c602337ea1a80fb7217eed=
a04e396cf90587dca'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers/&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'meta-flutt=
er' url=3D'<a href=3D"https://github.com/meta-flutter/meta-flutter.git">htt=
ps://github.com/meta-flutter/meta-flutter.git</a>' branch=3D'scarthgap' com=
mit=3D'HEAD' disabled=3D'true'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;.&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-flutter-apps&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;/layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'oe-core' u=
rl=3D'<a href=3D"https://git.openembedded.org/openembedded-core">https://gi=
t.openembedded.org/openembedded-core</a>' branch=3D'scarthgap' commit=3D'2b=
3d2b671a149cbeea2bdc9ba42192da2015c3b7'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;/layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'meta-tisdk=
' url=3D'<a href=3D"https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git">htt=
ps://git.ti.com/git/ti-sdk-linux/meta-tisdk.git</a>' branch=3D'scarthgap' c=
ommit=3D'32482cad2f630892b733c1457b9e9d835b098174'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-ti-foundational&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;/layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp; &lt;/repos&gt;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp; &lt;tools&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;tool type=3D'oe-layerse=
tup'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;var name=3D'BITBAKE_INCLUSIVE_VARS' value=3D'yes'/&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/tool&gt;<br>
&#43;&nbsp;&nbsp;&nbsp; &lt;/tools&gt;<br>
&#43;&lt;/config&gt;<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_6a1d001000f84edcabf78998b27b883cticom_--

