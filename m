Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C542D116F3
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 18:41:06 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.104.1764614462720195569
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 10:41:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ZxK6uOL5;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.16, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9N6wivFkcbc5b1t9e4N0bFRlIqCZPSBpYxyF9a/s/zFUxSz7IkJz0JpPnEo9IpIcUqP1GCFfEAHEGIQev0QQqaKIDwqTEbJa0D9duudkKJl8/+to+nQRajVyU52Kgcj7ZBdxXKxuE7amvO3xdeGYSQp7I5V4EqaP/HWtdpe1hUJ2T7/4YgcYJJng6jDB0FIXJuvodzhZqyjVe0jX6XPpKh9D69+Nskrg5G2WJaoqPRBjPz2e+XkqHZ3B1j22cwhTYG28fbngxLTUx2gYYgYbjL8RDz2CfKVaURQZq3eZqp1v1NVIkSfPWvrAXdLfbxKorTrMFWumuOsHQ0OMTQI5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwV8714Sc/GRD/AGV2aBHOG9M48y+sIph6v75jP+xiU=;
 b=RTVAVxFrP0UHy4fBP3/TWZiyagaUBeULycmN16cAOENzmnu4bab+9B23Zx2/9N4HS172+I/Jq0sNKYXq7rd4LZTnhDURT9Sb39W261s4mR4LDwiwyiDPc/KFhobKm33wBCsHTB33dCznvUGtjKzBd2TVkuPB2NzTxUj05JVjuwLOyhmyFRsDDvpLbCPu6Hoz8Vp54pZH0YGJpk3lh4dmYuORV+x9F6NR7+FJCVVG5bRN0Z9guu1PE5RNaiImpd9qvqVH++Th8wnlW5M0njFzi2NAm1F2uqwKcmLJ6VuCWmI/OXUsm2nl7mPmvlyaow1xDABFQu+UEKELG33WjdV9Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwV8714Sc/GRD/AGV2aBHOG9M48y+sIph6v75jP+xiU=;
 b=ZxK6uOL5NGvWFDGAhr1HO4dNvxPbfe046n5mD+djYz996Iw4chjkIfaeWJwwko6MAutnsu9RV53qR4XwIBGeZG7mhbEHpO0mN6qf3jDghtT6iZR6C6qgyQlzxA6bmmYxiOJ/c9cVQp4GSU20GINbsya1OWDirBbL3tnqTybuL3Y=
Received: from MN2PR20CA0042.namprd20.prod.outlook.com (2603:10b6:208:235::11)
 by SJ0PR10MB5551.namprd10.prod.outlook.com (2603:10b6:a03:3d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 18:40:59 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:208:235:cafe::8e) by MN2PR20CA0042.outlook.office365.com
 (2603:10b6:208:235::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 18:40:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 18:40:58 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 12:40:56 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 12:40:55 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 1 Dec 2025 12:40:55 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B1IetVD917838;
	Mon, 1 Dec 2025 12:40:55 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vQ8pT-00000005kt3-3YNj;
	Mon, 01 Dec 2025 12:40:55 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] libdrm: Update patch for recent version bump to 2.4.128
Date: Mon, 1 Dec 2025 12:40:55 -0600
Message-ID: <20251201184055.1371866-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|SJ0PR10MB5551:EE_
X-MS-Office365-Filtering-Correlation-Id: 5953dd17-67bb-409c-d9d8-08de31092b82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qH2vrGSQXitVtx/lGQX5SmlrsYy3PqB5he/CkpBmIIeAb80wUHaDTQfFQPuv?=
 =?us-ascii?Q?s2g0LJV3n+tPm/aed6qit5fRxdOn8+2X7Ni3F7BFJKuh+ulroTvqIT4jtke2?=
 =?us-ascii?Q?Jd2+GQk8rDwxG6RouConlVLYJcIfPWq5emilr+qpbYk05Hk301ejosV4b13Y?=
 =?us-ascii?Q?CiFyDxn2y9z5Hk2GutpeUAUhehuhipgmn9tvqVXQNRJBAq99J7CRC5wlbSyf?=
 =?us-ascii?Q?O8e0Y8kJAsvN+ttGHVURFR+OyRymKw8k1okuka1z+u50xXMlmayXOH3nQIgH?=
 =?us-ascii?Q?w/4BrvOqwFfyq9rLI2VYzc1mwElntnKnfxJl+drQ68xnWO+P5z97UQj0MAXQ?=
 =?us-ascii?Q?VmI8XKOTJtffvTsuJTjIkRo+dX3gOVufhPQdGDVZrZG8KyQzNj56lgsvmtI1?=
 =?us-ascii?Q?R13XPGughMFKvUrXb32vqxXEr7PpQb6E+ZCKgB5Etl4bb8IvkFiiAu3laCb1?=
 =?us-ascii?Q?pT6kAfAni+G72mXpZfNEMv8xkaTAOsVK2rGEHsfxxwPypRvpiZcUNWtK4GDD?=
 =?us-ascii?Q?aCdMn4q1BHoMNZEuZ9h0/Eauy0fuBZjlhQoV2yJ5I4fg130mxAOdME3GuK2J?=
 =?us-ascii?Q?RD6euuzvifc79ijvNApjwsCn2TXjkXOKH7JM3fcmyTmToVBo71vgyttq6R1L?=
 =?us-ascii?Q?2IuiC2QmhDZB6gGX8IcfDFHYQ0u6ajie0O5TGieCHF1xVG6fWEVMc1mxt7GR?=
 =?us-ascii?Q?vuzCxxKM8RAh6RESXwA2Rqrhi4VNiGpoO35IsmHe2vIg7PJX0uq6cLIGjvbq?=
 =?us-ascii?Q?vEDeI88wKzgie3Iv3MUQQDPuQCU78sLQqBgvbdbK2ZyIP2NGYfKBdMTZTzNX?=
 =?us-ascii?Q?scGVSev8uH49rlYkZMl8Tozn7Wm2kTQTrO5WvHPaLs9li1VJmANgQgfyDDsx?=
 =?us-ascii?Q?1eWdYkRZiuQk9pQy+OExqZW6DfAufUbjk8zjeIq47Msl5tbQeAmHAw/qwwBC?=
 =?us-ascii?Q?s9JAwM7IjXZudC1EruOkKSM+YBnxv4mJVal8xWSEuoUrlp62elR54tQnGzIF?=
 =?us-ascii?Q?jBM5jKKl3rWVuIO4U+9TAIis6csZcjdGanQrtmmRFCEuP+qEcpmfnMaVqdj5?=
 =?us-ascii?Q?VwA2rfoTYUzTyNHHH0mEdw3PLsrEywLowgI/7nVMIBv+qaQwkyLIVUpG0P9N?=
 =?us-ascii?Q?GY844Dfxtxe/1KoCQd+PyeB7Rzo0N6qXKGQ96HH/s9FIKrdGM4ywTCCJWtDB?=
 =?us-ascii?Q?QnRKppefiT08pasxh9k3eaPww/SSRntCKMU+FlwUqwQu7CMmVlTlRbWyB0tM?=
 =?us-ascii?Q?MiyR1GW23qIuhv36q1k9zOAgh+LLYcriNb9/pKIoTINfFEveA7aWDpm8lS+G?=
 =?us-ascii?Q?N10HbKfsr9O8fwY3UJPnl+hCZKPHee5MEiXjo2A+d8Ikym5HAdQBDk/BLg5Y?=
 =?us-ascii?Q?Bl6aUM3ZoFL6Q53+Cj8QR/to+nc0aPbA8EXdAaujeNaovJTpm+wirxkSANFU?=
 =?us-ascii?Q?QLBKfwL9fQrfyLOF0lKFJdECio2SC6n75IKNEzSTsABf9ADEFaYbEISSD5X0?=
 =?us-ascii?Q?qcy732V1B+Y2WQX38w6HyrQChOrgjyZcHjc0Mq9YHigm+8+epUjHuiyL0jXC?=
 =?us-ascii?Q?Pzp8jnLvjmBNj82nOpY=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 18:40:58.7024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5953dd17-67bb-409c-d9d8-08de31092b82
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5551
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 Dec 2025 18:41:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16842

oe-core recently bumped the version of libdrm to 2.4.128 [1].  One of
our patches needed to be updated to apply cleanly.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3Dac7327583ae=
f83fd400190506f3147623de38b68

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...1-Add-option-to-run-a-test-indefinitely.patch | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-=
to-run-a-test-indefinitely.patch b/meta-arago-distro/recipes-graphics/drm/l=
ibdrm/0001-Add-option-to-run-a-test-indefinitely.patch
index 2abe5045..5b051361 100644
--- a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-=
a-test-indefinitely.patch
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-=
a-test-indefinitely.patch
@@ -21,7 +21,7 @@ diff --git a/tests/modetest/modetest.c b/tests/modetest/m=
odetest.c
 index d9e761e..687f7a4 100644
 --- a/tests/modetest/modetest.c
 +++ b/tests/modetest/modetest.c
-@@ -1887,7 +1887,7 @@ static void clear_cursors(struct device *dev)
+@@ -1888,7 +1888,7 @@ static void clear_cursors(struct device *dev)
  		bo_destroy(dev->mode.cursor_bo);
  }
 =20
@@ -30,7 +30,7 @@ index d9e761e..687f7a4 100644
  {
  	unsigned int other_fb_id;
  	struct bo *other_bo;
-@@ -1945,7 +1945,7 @@ static void test_page_flip(struct device *dev, struc=
t pipe_arg *pipes, unsigned
+@@ -1946,7 +1946,7 @@ static void test_page_flip(struct device *dev, struc=
t pipe_arg *pipes, unsigned
  		fd_set fds;
 =20
  		FD_ZERO(&fds);
@@ -39,16 +39,16 @@ index d9e761e..687f7a4 100644
  		FD_SET(dev->fd, &fds);
  		ret =3D select(dev->fd + 1, &fds, NULL, NULL, &timeout);
 =20
-@@ -2179,7 +2179,7 @@ static void usage(char *name)
+@@ -2194,7 +2194,7 @@ static void usage(char *name)
  	exit(0);
  }
 =20
--static char optstr[] =3D "acdD:efF:M:P:ps:Cvrw:o:";
-+static char optstr[] =3D "acdD:efF:M:P:ps:Cvrw:o:t";
+-static char optstr[] =3D "acdD:efF:M:P:ps:Cvrw:o:S:";
++static char optstr[] =3D "acdD:efF:M:P:ps:Cvrw:o:S:t";
 =20
  int main(int argc, char **argv)
  {
-@@ -2196,6 +2196,7 @@ int main(int argc, char **argv)
+@@ -2208,6 +2208,7 @@ int main(int argc, char **argv)
  	char *module =3D NULL;
  	unsigned int i;
  	unsigned int count =3D 0, plane_count =3D 0;
@@ -56,7 +56,7 @@ index d9e761e..687f7a4 100644
  	unsigned int prop_count =3D 0;
  	struct pipe_arg *pipe_args =3D NULL;
  	struct plane_arg *plane_args =3D NULL;
-@@ -2299,6 +2300,9 @@ int main(int argc, char **argv)
+@@ -2314,6 +2315,9 @@ int main(int argc, char **argv)
 =20
  			prop_count++;
  			break;
@@ -66,7 +66,7 @@ index d9e761e..687f7a4 100644
  		default:
  			usage(argv[0]);
  			break;
-@@ -2449,7 +2453,7 @@ int main(int argc, char **argv)
+@@ -2464,7 +2468,7 @@ int main(int argc, char **argv)
  				set_cursors(&dev, pipe_args, count);
 =20
  			if (test_vsync)
--=20
2.43.0


