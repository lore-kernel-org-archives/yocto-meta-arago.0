Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597CDF47CA0
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 17:34:54 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50054.1772732091141114907
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 09:34:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=VtzDVejr;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.22, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V35BeDr3w0TU3mstquX7qdBLprtgqy74LkJIacDx+R2NBDzGn0a1aaeL9sh0/dGPf/wz1ezP1r5bSgs6jaw0QqWS3xuZK+hjez38Y/ThBfSe1R/ado37zGeh0hgDkSo4lTGKUfdNpcdhtRQJXJd8xXmt1p98iaX+tmZAxQ+Rf1u4nNaMbGm3YXKTYKwN8gubSaEbfIzNsfQecVSiAOf2JiWRp/ZxxCQyIvd2yezojR1BX7M/uaitcDeS0JL1MTuJoFwAX9KJ3vdSz58aqcHII+8fXLjv8tr0BMJZBVzQhxQ5YQAxpsoaOpJr95J7wLkhZxntUEuCa32oeyYlnw52+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FbwOn91W/+oX3kPmSJrsRynQU4SJX07EIJI5f91FfY4=;
 b=kkwpd5Kh5Pn5jB8oYnQeYqqKCi1ZppSVmhSsP8JU9+GL/4/cjVnv+wqDuTGbcqFRr/Tdv78p6KVnai7QptdZWVGbDTAeMlrnMdaneHjeVaRtAQOpo45a4rSjdZvxPbd6Sh6Bd9lkFH7g3Khqqe1GjrYM8lG2hD9KYjGwvADfa3hmSpiwYfVDhWrnGbT8vMYwZYFFAmSOoHjMD6vJBxwUqK8toQoSuEgdTU+5HHZ7hFBEcsmFQEJ6s4rZyuHV9GbU6zcftn3ogcPpqYPWS7ga8lHg0BMCOUIHvmKAMDWbJsibfVm0/NbPCggMXzwv1ez0DfpkRzpp6y9uHfcyYWkKHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FbwOn91W/+oX3kPmSJrsRynQU4SJX07EIJI5f91FfY4=;
 b=VtzDVejr1dWDDF67ygcufyA+rP35C/Op7Ek0ZqrjPQHIYPrO1hPIXwf0tM7jMa/oFcoOLJiicstSrGH0Le8VaPxdX+5YzZmkNn2Hs6uoAc35t71cdIB7HV/SqEI9u8PbgxlWhFplu3R8rL78CMaISjtczs0DlM09t83O072dIsY=
Received: from PH0PR07CA0067.namprd07.prod.outlook.com (2603:10b6:510:f::12)
 by BY5PR10MB4114.namprd10.prod.outlook.com (2603:10b6:a03:211::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 17:34:43 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:510:f:cafe::c3) by PH0PR07CA0067.outlook.office365.com
 (2603:10b6:510:f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 17:34:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 17:34:42 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 11:34:24 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 11:34:23 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 11:34:23 -0600
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625HYLRi2269842;
	Thu, 5 Mar 2026 11:34:21 -0600
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v2 0/4]  Migrate GP AI Stacks
Date: Thu, 5 Mar 2026 23:04:15 +0530
Message-ID: <20260305173419.1735480-1-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|BY5PR10MB4114:EE_
X-MS-Office365-Filtering-Correlation-Id: 5512a433-064b-4d85-8480-08de7add7c41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|34020700016|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	hhIAz+xaPvvfYFSAj5L+VwIu3fBi0okOlCJMqzqS70y2JmXb3l5JCjDEDJUeKFPATYeOGXh5FwOzxBD3yir4QOMYDVLJksiHue6xZyrMZVg10VwAAnaj5NsdB7lapi0Uf5UVkoYHkrX4K55hvy+pAXVqhboNsuSGCPVZkIJo8mOoKwdlIHtj2sm97uG2RB4EwurpJTACEqnapcg7Uspu7aEdoCi/R/aUP8gM1bsLH8Hm/tPM/LhXvXmlnAn/DrI8mmsw1w7T1eoXEOhyTJm4IHTCLQ+NpjCldhwm4ph2jlpfec36SO9+z5IPo0HsZbTtPrnAkqDLDnrnzbFnC6rlgi5+pyh68h6f0VFBBhI7M1swDGfXd4uOYIexcT9m90J1L7sDNBqch/ySUBamPvf9k3Pipxv79vXBfJA80fFdmDzHKirWAaiNEd7/FQofCcrqcf+50C4EMGtxYZvoWcb4C6UDRWL7vrTOGPoye0bWX9DV2IHW70a2muBtTjIwoVD63X0YQ0M6tk1lgLqjW2oyMmlGjHAgRVmXJ8j0XB2AQboRkZjmyg1ZSy7rsrDexSW4BQH0lPL0L9iAHrmPhoow46FHlP30nYF7PnHtU25foal1nlNXcd/ZZJzv/t2cIS4mx0KbY6xZFPtSRKfci1ntF3Oxn+i6/Y6fBjtPOhSsNGvN36HUl91HIbfNkdiXOrG/h73xty8cI78wdeU/u8D/EwVzdos6lJpALIgE9Y/pkaA=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(34020700016)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	KOiGmMHF7B3VuajOILn+kaV1dst/kNdLqgjxCrfm2C0+lLWI/8kZ36iN05Gcbea+b4YMXQsofrahFkEkysNDiQ/KzPW2DzWdOOT1JU74kc704YvfmMz5ehZeRMwSmmXqxm6zTqs7qcTAHOq00mYNm/NKO6p9nNWhU8gs+mdAdyPOHp38cQKUuEN7TLPhh1gOCeStGUChjIxP4rVqWWRoXUX/8ZbYWKNSDhwjp9awpGQm+lh+KDY0rm4yVEgOeSUJRCKpHjkLA+LnV+lxAjajSsrr6g+hNnoLw2KAKkEg4rMYzzalwqXksYloWu8keGBPq9H2Pw7qOjXx44l5BeqZVaonZWyZolv6AooZ5QiFfrRpweHMdajLElIqn367zSvPArhhUvPfiLqvAgeBJ+L2dtTDy347sam0NNFFkd89n30ZOOJJNhbrd+GfjIKGkuFk
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 17:34:42.3436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5512a433-064b-4d85-8480-08de7add7c41
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4114
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 17:34:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17247

Hello Team,

This patch series provides an upgrade of the ML framework
stack in meta-arago, bringing all components to their latest stable
versions. The upgrades are ordered by dependency hierarchy to ensure
proper build compatibility:

1. ARM Compute Library: v24.12 =E2=86=92 v52.07
2. ARM NN: v24.11 =E2=86=92 v26.01
3. TensorFlow Lite: v2.18.0 =E2=86=92 v2.20.0
4. nnstreamer: v2.4.4 =E2=86=92 v2.6.0

### Benchmarking Results:

 - arm-compute-library
   - https://gist.github.com/PrathamTI/7031b8646dec1887f8375fc886a5321d
   - https://gist.github.com/PrathamTI/d051afea17832175bdce65907b2d07a1
=20
 - tensorflow-lite
   - With XNNPack Enabled=20
     - https://gist.github.com/PrathamTI/54978841a77c58fbd4ca567f03e890df
   - With XNNPack Disabled=20
     - https://gist.github.com/PrathamTI/096ce1ed02d5577a7f44bc1c7f6b2569

 - nnstreamer
   - https://gist.github.com/PrathamTI/fe06aacff9ad69f5e7c6ca6c04de1808

Pratham Deshmukh (4):
  arm-compute-library: upgrade 24.12 -> 52.07
  armnn: upgrade v24.11 to v26.01
  tensorflow-lite: upgrade 2.18.0 -> 2.20.0
  nnstreamer: upgrade 2.4.4 -> 2.6.0

 ...NABLE_NEON-in-code-for-checking-NEO.patch} |  72 ++---
 ...-indention-in-cmake-generator-script.patch | 130 ---------
 ...ENABLE_SVE-in-code-for-checking-SVE.patch} | 117 ++++-----
 ...ce-files-at-library-definition-time.patch} | 246 ++++++++++--------
 .../0004-Allow-ARMv7-builds-using-CMake.patch | 174 +++++++++++++
 ...ptions-for-SVE-SVE2-and-BF16-support.patch | 112 --------
 ...mbol-error-when-building-TensorInfo.patch} |  24 +-
 ...SVE2-support-to-be-disabled-in-CMake.patch |  91 -------
 .../0006-Remove-TARGET-dependency.patch       |  58 +++++
 .../0007-Allow-ARMv7-builds-using-CMake.patch |  86 ------
 ...rate-generic-library-name-instead-of.patch |  33 +++
 .../0008-Add-FP16-source-path.patch           |  28 ++
 ...24.12.bb =3D> arm-compute-library_52.7.0.bb} |  56 ++--
 .../armnn/{armnn_24.11.bb =3D> armnn_26.01.bb}  |  10 +-
 .../flatbuffers/flatbuffers-arago.inc         |   8 +
 .../flatbuffers/flatbuffers.bbappend          |   4 +
 .../protobuf/protobuf-arago.inc               |  18 ++
 .../protobuf/protobuf_%.bbappend              |   5 +
 ...0001-Update-CMakeLists-for-building.patch} |  19 +-
 ...akeLists-for-building-shared-object.patch} |  53 ++--
 ...uild-issues-observed-in-TFlite-v2.18.patch |  35 ---
 ...te_2.18.0.bb =3D> tensorflow-lite_2.20.0.bb} |  51 ++--
 ...nstreamer_2.4.4.bb =3D> nnstreamer_2.6.0.bb} |   2 +-
 23 files changed, 664 insertions(+), 768 deletions(-)
 rename meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/{0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch =
=3D> 0001-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch} (58%)
 delete mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/=
arm-compute-library/0001-fix-Fix-indention-in-cmake-generator-script.patch
 rename meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/{0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch =
=3D> 0002-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE.patch} (67%)
 rename meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/{0004-Add-source-files-at-library-definition-time.patch =3D> 0003-A=
dd-source-files-at-library-definition-time.patch} (24%)
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/=
arm-compute-library/0004-Allow-ARMv7-builds-using-CMake.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/=
arm-compute-library/0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.pa=
tch
 rename meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/{0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch =3D=
> 0005-Fix-undefined-symbol-error-when-building-TensorInfo.patch} (68%)
 delete mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/=
arm-compute-library/0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake=
.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/=
arm-compute-library/0006-Remove-TARGET-dependency.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/=
arm-compute-library/0007-Allow-ARMv7-builds-using-CMake.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/=
arm-compute-library/0007-cmake-Generate-generic-library-name-instead-of.pat=
ch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/=
arm-compute-library/0008-Add-FP16-source-path.patch
 rename meta-arago-extras/recipes-devtools/arm-compute-library/{arm-compute=
-library_24.12.bb =3D> arm-compute-library_52.7.0.bb} (58%)
 rename meta-arago-extras/recipes-devtools/armnn/{armnn_24.11.bb =3D> armnn=
_26.01.bb} (88%)
 create mode 100644 meta-arago-extras/recipes-devtools/flatbuffers/flatbuff=
ers-arago.inc
 create mode 100644 meta-arago-extras/recipes-devtools/flatbuffers/flatbuff=
ers.bbappend
 create mode 100644 meta-arago-extras/recipes-devtools/protobuf/protobuf-ar=
ago.inc
 create mode 100644 meta-arago-extras/recipes-devtools/protobuf/protobuf_%.=
bbappend
 rename meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite=
/{0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch =3D> 0001=
-Update-CMakeLists-for-building.patch} (72%)
 rename meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite=
/{0002-lite-Update-CMakeLists-for-building-shared-object-li.patch =3D> 0002=
-Update-CMakeLists-for-building-shared-object.patch} (50%)
 delete mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/ten=
sorflow-lite/0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.patc=
h
 rename meta-arago-extras/recipes-framework/tensorflow-lite/{tensorflow-lit=
e_2.18.0.bb =3D> tensorflow-lite_2.20.0.bb} (84%)
 rename meta-arago-extras/recipes-multimedia/nnstreamer/{nnstreamer_2.4.4.b=
b =3D> nnstreamer_2.6.0.bb} (97%)

--=20
2.34.1


