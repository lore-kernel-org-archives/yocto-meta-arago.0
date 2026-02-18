Return-Path: <b-brnich@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF5EE9A04D
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 23:05:40 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2421.1771455931294739515
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Feb 2026 15:05:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=MmAVBRd9;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.0, mailfrom: b-brnich@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wjZj2OVSQGpj+8YhGQ6Gl8LwXik2PFmbE5ZPsiMP+ETh6IidD56fKpuqAA9IojsPGBuhTrpDMAfOIRo+w8CSUzfzz1X/+IepNLZKAfvgBk5rAEZOLSAih9Cz4xvmFgeo/OlCVzAhdkB7ozuBc3NHzmv8gVe65Ejm/EB0M58iYJVRXTf3n2akEIQ0b//MBYut3E5q3GLIc9JH2482DXgWk7PMLJczqUNxQDhB0NBlrRj8A7aAhPpAChyW+zIM/ZXAgy41hhd+kWhLOKkU3gZF0HUlc//eiuip/HRXSuFyapGMx9TRFUnc4oMeh4HRWbBQD08k/J0SBfktwlb6clokwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyuMmBn0dvALOlpoo1gF+6LeLGYfeOfNsADeHIj5HlY=;
 b=nPtnqk9AuWE+NPz3mK/tMpHOIo1gUY4+GzMb1+sQVzaqETnjgGfgFIcbd3jOyOxwOzdhJyMqxnIwC47Dj/4N4sC3aUyf824JbDRv0l923RQkIW7xHkM/bdK7djHVtNMuxSZrbC5u9GkXUnhCNnJfND0pS1ce2rFEHWS0cmdgKA0ncD67qa9He0JlChRT29dYZM3ps5V6lkXUuv8bz3vnkbUbFlJZJ6BaUXO0eJnUw67iIHeBlVm4fA/l9uGc8zBn1keUrkF1tIB29qY84wM3dWUD/fTT48eF5XyGfFYV7Iqn670T1owEAcDIZgyTqIod5DHPYptCPo9H+rnC1bVu/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyuMmBn0dvALOlpoo1gF+6LeLGYfeOfNsADeHIj5HlY=;
 b=MmAVBRd9GZd6YAjiraHiYv82Pjs+OZUJlbz7RxiG415vJJwav24m2TgJw8oDRm88o5FwPXWAiZqh0Oa2oal6vvc+/Najj79OIVuAYWlJZDnx6+/KSymqgdJv1WiIz7F24UJwpbhKUOpvuwv7TgdkDE7g9q4lQeBvE14ZCMPqqr8=
Received: from SJ0PR03CA0285.namprd03.prod.outlook.com (2603:10b6:a03:39e::20)
 by PH7PR10MB6652.namprd10.prod.outlook.com (2603:10b6:510:20b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 23:05:28 +0000
Received: from CO1PEPF00012E60.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::db) by SJ0PR03CA0285.outlook.office365.com
 (2603:10b6:a03:39e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 23:05:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF00012E60.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 23:05:26 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 17:05:26 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 17:05:26 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 17:05:26 -0600
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.81.69])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61IN5Qvi1154781;
	Wed, 18 Feb 2026 17:05:26 -0600
From: Brandon Brnich <b-brnich@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Brandon Brnich <b-brnich@ti.com>, "Darren
 Etheridge" <detheridge@ti.com>, Devarsh Thakkar <devarsht@ti.com>, "Thorsten
 Lannynd" <t-lannynd@ti.com>
Subject: [meta-arago][master][PATCH] gstreamer: Fix CMA Exhaustion in latest gstreamer
Date: Wed, 18 Feb 2026 17:05:25 -0600
Message-ID: <20260218230526.2371291-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E60:EE_|PH7PR10MB6652:EE_
X-MS-Office365-Filtering-Correlation-Id: f37cbed0-611c-43c0-871c-08de6f423457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DQ0wV4G87PTpXps0+J0igtx0+Lh9sCkkXMohgzAIgbNiJ2Zf44RYDNWnsjjJ?=
 =?us-ascii?Q?fegjJ6jO9bcZNcpXwJqN6r95NVpbau/jKeea1fVJBRp18kuP9Qe6yVQy40KU?=
 =?us-ascii?Q?70meTLRcr/swKVkYWeAvvxf1QAbIJQ67L/82CL2e1l+RR5DvqoVd1r/AEp8/?=
 =?us-ascii?Q?5VwE/PVRDQPGKge0j3DqgylN6mQlLKALhBYFWkUe8Tlt5HA1a5Ez4u8pmNkr?=
 =?us-ascii?Q?YzayOjuQYSMweax0xx6UMJTiUsWsDrraphfnMqN39wELxPnF3mLBFG5pK7WI?=
 =?us-ascii?Q?huUXxJnM0yVogtLoradsYXgBu0V+dowhjuWqMBtQuQJkBISQlA8x95qIK9+F?=
 =?us-ascii?Q?V3bXWnH2QVST8PxO2YHnA/wsGC5QtwPodSmWmr09iiAdGPD+J/BDs2h9Dpzw?=
 =?us-ascii?Q?9bZ5dF+v/zb3UYfBtShSisfxrg2MfG7ooLr5yYWwhZzJ+wW10EdizOClJNJg?=
 =?us-ascii?Q?XJ8hbwiUu9FVYD0egvsxFhADBtnE+8x8v+llVTpVGrMXuWaeS2xPhgmyLVOS?=
 =?us-ascii?Q?ra1uC6Faw6JJgLJc6HvWhnDEZOZiXZy2Ds0+7YNhKzkfUwg6nmrll2R2cGg7?=
 =?us-ascii?Q?RM/S0chtkOHJq5Rc/sY67LKLFTyLeKdiO4tj52D9HyqgBLnGs+u39sK6svp1?=
 =?us-ascii?Q?drD68w/QTTLHO/2OhiewXb2Nk+fGxCBbzxBOmTTIBY6896UrrpC8mn4fXOrY?=
 =?us-ascii?Q?dzpSwkdqhzXLwM+f2gJGbMABWxDEdSRHJKv99+zfbIOccb9bPIiWnGKkPKz1?=
 =?us-ascii?Q?DYLuACd0uJRVqVrw+aETbFLkoFD03SQmI/9R6RYNHCzlowLx6WdkerUR7eQU?=
 =?us-ascii?Q?T6aN5+arzLXemcdh3FL26Ft2e0VBZQFYgWjEeRkXLe7xI8Fg6WfmZerKF8aI?=
 =?us-ascii?Q?zx8egAES8wtTTdDGcZfbMn7gx+PEXAy752s159LiW29CUEVFkcWLG/HB6ojc?=
 =?us-ascii?Q?vDEpiFyvEJjM53W4HqIdjjuCt9Mtyc2v5vA98Mmy+b+zMGqgBa1bzHOeKWHC?=
 =?us-ascii?Q?mJetnwyE62E5gFHMVksS2JsARWgGBCB+/1NZ95/m0rXARO8pw3vQ6H9CKcqa?=
 =?us-ascii?Q?RCls0g43BlowKjPy9RWg9FsYACVXKn6E6L/amNRBSq8TeicEZWRUP0hAqU7s?=
 =?us-ascii?Q?+YkTtgQNkyChnekN+j7h9YImwl7R6Ur1F2NQXbBpMpam8NlPtLnKQkQYa/4c?=
 =?us-ascii?Q?t01vxha+wu9vQcxzPIOtwC7Mq33vabRuz9KPGveBWRfcoynFnhM44VSkpEXs?=
 =?us-ascii?Q?eXn/VUUaRbKO/2Yn1w8vvEkbSTnwFQVP3MibK2utEzQ2WIoCZGbXp3JBwPne?=
 =?us-ascii?Q?JK4Xh/HLN3DeefaMXsB1VeE5vQDFvX6PQ+UYowGaw/dqf/XH4CCal9VX31tF?=
 =?us-ascii?Q?//Wzbi/NoOFtC6hfDwt8pYHQfsxMWHNxTBtuylKNsZnVeabc8d7PPDTSUKDL?=
 =?us-ascii?Q?1uWw39PGCA+XAac9VBDKEkpu/9TGJANujCWeRf4ZJ9uLHPOxzr77gTWi1ssG?=
 =?us-ascii?Q?/hoUgUPsnnlOEarX6lpTTroTiUqyfbEsX8+x0XpDQDR1BU5ZgRrRMsB4UiZj?=
 =?us-ascii?Q?AfpHkk9biw+9QCZHFMa0XzZOvDdL1ktYFwOPMkxFGc2Czg7a3WISXrOuts5P?=
 =?us-ascii?Q?hDZ5R+bXKzfxy3ATJDPCRMOY/3TRB/BwXQBUAmHpZqJDqtpe7r0Rmvw/tAG+?=
 =?us-ascii?Q?cYiQZQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	3h9A3S9WINF1FpqH8B68ZATaIl5ngvcgpxvv653EIhE4WRSfkHbPe1D+EyCNL4JvsqPe1RxjpBWaFwHAojaovfoEwyqdLSfws46aFoPMIKYag5qNL6oZiom9Nl74ObsKik48OgTrhwfRzcbF3GLHzbUxB3HOZCBDsMZIOiI+lrcYXCeP7Aq3BQ4kFYry62HFZqUgndzpujmHpgKEO9WHiaRZ74qum+8cUEBzwACFNz3F//lWE1P3h/rYC9zyIZHDfnqVKMJFb6dpLuxVaPcPmO5S+tA1ycctutIA0HAb8IzYaC3IVsvT09b3QuweI+KeW3mk5gQgn+9LbzV5Fjn0I+pLgwqkshiULbsrtgp6jGss9s7Q9PKlCGbgfcnapLEkdiB5HMoRd9oRpK5eNT+Vl9orQb1gPj2R3YQWaJugF6ZbfKNR8fbUrExME9SOoqYC
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 23:05:26.8604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f37cbed0-611c-43c0-871c-08de6f423457
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E60.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6652
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Feb 2026 23:05:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17124

Instead of calculating compressed buffer size based on the maximum
capabilities of the decoder, allocate based on the negotiated resolution
between elements.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 ...ctual-stream-resolution-for-encoded-.patch | 139 ++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.26-arago.inc  |   1 +
 2 files changed, 140 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreame=
r1.0-plugins-good/0006-v4l2object-use-actual-stream-resolution-for-encoded-=
.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-good/0006-v4l2object-use-actual-stream-resolution-for-encoded-.patch =
b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/=
0006-v4l2object-use-actual-stream-resolution-for-encoded-.patch
new file mode 100644
index 00000000..53b2ead3
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-g=
ood/0006-v4l2object-use-actual-stream-resolution-for-encoded-.patch
@@ -0,0 +1,139 @@
+From b4960f715e6aacf732768e57b0647001b44ec4e0 Mon Sep 17 00:00:00 2001
+From: Brandon Brnich <b-brnich@ti.com>
+Date: Wed, 18 Feb 2026 13:10:41 -0600
+Subject: [PATCH] v4l2object: use actual stream resolution for encoded buff=
er
+ sizing
+
+Newer versions of gstreamer changed OUTPUT buffer sizing from a fixed
+2MB to a dynamic calculation based on the driver's maximum capability.
+This causes severe CMA exhaustion on devices like TI AM62P where the
+wave5 decoder reports 8K (8192x4320) as maximum capability:
+
+- 1080p streams get 8K-sized buffers (16.9 MB instead of ~1 MB)
+- Wave5 ring buffer is 4x OUTPUT size =3D 67.5 MB (instead of ~4 MB)
+- Total waste: ~89 MB CMA for 1080p content
+
+Fix by using the actual stream resolution from negotiated caps (width
+and height are already available as local variables in
+gst_v4l2_object_set_format_full) instead of the driver's maximum
+capability stored in v4l2object->max_width/max_height.
+
+Upstream-Status: Pending
+
+Signed-off-by: Brandon Brnich <b-brnich@ti.com>
+---
+ sys/v4l2/gstv4l2object.c | 29 +++-------------------
+ sys/v4l2/gstv4l2object.h |  3 ---
+ 2 files changed, 4 insertions(+), 28 deletions(-)
+
+diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
+index 453ff03d98..dbfe4992be 100644
+--- a/sys/v4l2/gstv4l2object.c
++++ b/sys/v4l2/gstv4l2object.c
+@@ -3123,8 +3123,6 @@ gst_v4l2_object_probe_caps_for_format (GstV4l2Object=
 * v4l2object,
+   template =3D gst_structure_new_empty ("fields/holder");
+
+   if (size.type =3D=3D V4L2_FRMSIZE_TYPE_DISCRETE) {
+-    guint32 maxw =3D 0, maxh =3D 0;
+-
+     do {
+       GST_LOG_OBJECT (v4l2object->dbg_obj, "got discrete frame size %dx%d=
",
+           size.discrete.width, size.discrete.height);
+@@ -3141,16 +3139,8 @@ gst_v4l2_object_probe_caps_for_format (GstV4l2Objec=
t * v4l2object,
+           results =3D g_list_prepend (results, tmp);
+       }
+
+-      if (w > maxw && h > maxh) {
+-        maxw =3D w;
+-        maxh =3D h;
+-      }
+-
+       size.index++;
+     } while (v4l2object->ioctl (fd, VIDIOC_ENUM_FRAMESIZES, &size) >=3D 0=
);
+-
+-    v4l2object->max_width =3D maxw;
+-    v4l2object->max_height =3D maxh;
+     GST_DEBUG_OBJECT (v4l2object->dbg_obj,
+         "done iterating discrete frame sizes");
+   } else if (size.type =3D=3D V4L2_FRMSIZE_TYPE_STEPWISE) {
+@@ -3202,9 +3192,6 @@ gst_v4l2_object_probe_caps_for_format (GstV4l2Object=
 * v4l2object,
+       /* no point using the results list here, since there's only one str=
uct */
+       gst_v4l2_object_update_and_append (v4l2object, pixelformat, ret, tm=
p,
+           sysmem_tmpl, dmabuf_tmpl);
+-
+-      v4l2object->max_width =3D maxw;
+-      v4l2object->max_height =3D maxh;
+     }
+   } else if (size.type =3D=3D V4L2_FRMSIZE_TYPE_CONTINUOUS) {
+     guint32 maxw, maxh;
+@@ -3235,9 +3222,6 @@ gst_v4l2_object_probe_caps_for_format (GstV4l2Object=
 * v4l2object,
+       /* no point using the results list here, since there's only one str=
uct */
+       gst_v4l2_object_update_and_append (v4l2object, pixelformat, ret, tm=
p,
+           sysmem_tmpl, dmabuf_tmpl);
+-
+-      v4l2object->max_width =3D maxw;
+-      v4l2object->max_height =3D maxh;
+     }
+   } else {
+     gst_structure_free (template);
+@@ -3312,8 +3296,6 @@ default_frame_sizes:
+       min_w =3D min_h =3D 1;
+     if (max_w =3D=3D 0 || max_h =3D=3D 0)
+       max_w =3D max_h =3D GST_V4L2_MAX_SIZE;
+-    v4l2object->max_width =3D max_w;
+-    v4l2object->max_height =3D max_h;
+
+     /* Since we can't get framerate directly, try to use the current norm=
 */
+     if (v4l2object->tv_norm && v4l2object->norms) {
+@@ -3897,14 +3879,11 @@ field_to_str (enum v4l2_field f)
+ }
+
+ static guint
+-calculate_max_sizeimage (GstV4l2Object * v4l2object, guint pixel_bitdepth=
)
++calculate_encoded_sizeimage (guint width, guint height, guint pixel_bitde=
pth)
+ {
+-  guint max_width, max_height;
+   guint sizeimage;
+
+-  max_width =3D v4l2object->max_width;
+-  max_height =3D v4l2object->max_height;
+-  sizeimage =3D max_width * max_height * pixel_bitdepth / 8 / 2;
++  sizeimage =3D width * height * pixel_bitdepth / 8 / 2;
+
+   return MAX (ENCODED_BUFFER_MIN_SIZE, sizeimage);
+ }
+@@ -4170,7 +4149,7 @@ gst_v4l2_object_set_format_full (GstV4l2Object * v4l=
2object, GstCaps * caps,
+
+     if (GST_VIDEO_INFO_FORMAT (&info.vinfo) =3D=3D GST_VIDEO_FORMAT_ENCOD=
ED)
+       format.fmt.pix_mp.plane_fmt[0].sizeimage =3D
+-          calculate_max_sizeimage (v4l2object, pixel_bitdepth);
++          calculate_encoded_sizeimage (width, height, pixel_bitdepth);
+   } else {
+     gint stride =3D GST_VIDEO_INFO_PLANE_STRIDE (&info.vinfo, 0);
+
+@@ -4190,7 +4169,7 @@ gst_v4l2_object_set_format_full (GstV4l2Object * v4l=
2object, GstCaps * caps,
+
+     if (GST_VIDEO_INFO_FORMAT (&info.vinfo) =3D=3D GST_VIDEO_FORMAT_ENCOD=
ED)
+       format.fmt.pix.sizeimage =3D
+-          calculate_max_sizeimage (v4l2object, pixel_bitdepth);
++          calculate_encoded_sizeimage (width, height, pixel_bitdepth);
+   }
+
+   GST_DEBUG_OBJECT (v4l2object->dbg_obj, "Desired format is %dx%d, format=
 "
+diff --git a/sys/v4l2/gstv4l2object.h b/sys/v4l2/gstv4l2object.h
+index 4b14b7e625..2b8dbd13c5 100644
+--- a/sys/v4l2/gstv4l2object.h
++++ b/sys/v4l2/gstv4l2object.h
+@@ -232,9 +232,6 @@ struct _GstV4l2Object {
+    * on slow USB firmwares. When this is set, gst_v4l2_set_format() will =
modify
+    * the caps to reflect what was negotiated during fixation */
+   gboolean skip_try_fmt_probes;
+-
+-  guint max_width;
+-  guint max_height;
+ };
+
+ struct _GstV4l2ObjectClassHelper {
+--
+2.43.0
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-good_1.26-arago.inc b/meta-arago-extras/recipes-multimedia/gstreamer/=
gstreamer1.0-plugins-good_1.26-arago.inc
index a9353189..f64790bc 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-g=
ood_1.26-arago.inc
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-g=
ood_1.26-arago.inc
@@ -6,6 +6,7 @@ SRC_URI:append =3D " \
     file://0004-v4l2-Give-preference-to-contiguous-format-if-support.patch=
 \
     file://0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch=
 \
     file://0001-v4l2jpegenc-Add-support-for-cropping-in-JPEG-Encoder.patch=
 \
+    file://0006-v4l2object-use-actual-stream-resolution-for-encoded-.patch=
 \
 "
=20
 PR:append =3D ".arago0"
--=20
2.43.0


