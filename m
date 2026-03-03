Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 246BCEC0463
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 09:13:47 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14269.1772529225440012508
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 01:13:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=E8WYjyzy;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.67, mailfrom: y-hegde@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cn7ABmVHV1O3oVNBcrO5b9ylp3AGz0TFbQ6Idlq1LBrEd0OoGT3sRwU+cqVAhFLsVD/J3C8n8YHFLEJDdeeFSYGlMH3PtyJ6yKYxdezCYPcgcne7LheK8bJZ6zZk7Hrn3Ww1Nr83xG1NC8l6gGnpTcZDFtqI169ywYm4Ia8GcNSTfNruACjLGeMIhfyBfkcTRpKEJwavFSgAGuNR/E6Rxvvwb+yTeejCcBYLeOOyTZfEwq2pNV5PSxRqm6DTtJI6PbJTBjR3iJMNCfLBxBZjc/G/p/PlPhOSy4eskjMEigsS8+Gde9rudezoMfUKFTPIWV+BCfjx2vZi/VBIblCWvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/Votn85S5bRWqnIpIC03CMmzC2r7NWOQ4o9/jwAly0=;
 b=X1uBJWTCmuq1k97Sf8qeK0jT0qatmGPWMOTA3YI9jfEsR8/lkG5Q/VTLLN4AX6RFzV6DOqIF4Zk0QonKcD8WFVxW5twSSmpP1jZ4nMjp/Qq+1diepSSvaao52uU6TmQerUf9JgG9Iol+aSi0Yo1+NLjxX1CQIf9UvuQ8lFHBrCXaUf9ZCI+CZpNtvmjEygyHTF8moTGGHK9bCRbYVfj/c9MlhQVkOoFkel/GBz3gEoHWZa/LmGv8YISGz88TLvRAbRDuZasry9jODY+ZmXb6avUm2g3R1ebZVrjrGinWwJGbqOTyxjuKztOUmnIn87jgJPBBcF3xoHuqiix3FPYPeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/Votn85S5bRWqnIpIC03CMmzC2r7NWOQ4o9/jwAly0=;
 b=E8WYjyzy35SPmCbXK61DTQr8tKemYqNDHigWX25IaygMIqRfg9lNugfaR4Bhm0O8/88ScvKp5wunAfxlmcs2Si06hntN4/QM63q1ec13spS9wZeWGk66f7V0AhWgeTaeJKljUKGRuJhvB5jra8WbeadgcWEeT4CSCX+qQpYnh18=
Received: from DM6PR13CA0029.namprd13.prod.outlook.com (2603:10b6:5:bc::42) by
 BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 3 Mar
 2026 09:13:42 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:bc:cafe::f3) by DM6PR13CA0029.outlook.office365.com
 (2603:10b6:5:bc::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Tue,
 3 Mar 2026 09:13:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 09:13:42 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 03:13:40 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 03:13:39 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 03:13:39 -0600
Received: from localhost (yogi-work-pc.dhcp.ti.com [10.24.72.146])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6239DcSY2352747;
	Tue, 3 Mar 2026 03:13:39 -0600
Date: Tue, 3 Mar 2026 14:43:38 +0530
From: Yogesh Hegde <y-hegde@ti.com>
To: <t-lannynd@ti.com>
CC: "meta-arago@lists.yoctoproject.org" <meta-arago@lists.yoctoproject.org>,
	"Etheridge, Darren" <detheridge@ti.com>, "Brnich, Brandon" <b-brnich@ti.com>,
	"Christidis, Antonios" <a-christidis@ti.com>, <afd@ti.com>
Subject: Re: [meta-arago][master][PATCH 3/4] meta-arago-test: Add curl-cffi
 and yt-dlp to ti-test-extras
Message-ID: <20260303091338.yx2uc6z56lncc75z@yogi-work-pc>
References: <20260302205436.1117890-1-t-lannynd@ti.com>
 <20260302205436.1117890-3-t-lannynd@ti.com>
 <c7bb76ec-980b-4086-a399-c7e76774e713@ti.com>
 <dc5504deaef94d898642129969ad77c7@ti.com>
 <fd8bd7c4-4348-430f-9f6f-ce9304aa8b0f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <fd8bd7c4-4348-430f-9f6f-ce9304aa8b0f@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|BLAPR10MB5009:EE_
X-MS-Office365-Filtering-Correlation-Id: 404347ce-437e-4df4-60e5-08de79052a25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|34020700016|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	8hhcllSbEjZn6ycr8tVwxwGEGzdEOBXBsPqhy01cqh+wIqPinPx0Kmt1RGkZbLocQipFvIgPKicquFQsV7Fh2Ol/CJHtcoCwKPn+Y+jx+C3gdGirZlX9yG6pPAv4rh1amIQIicw0dyNUqup4BKvntKRZLwvVps6NHyHPBnZFb13iA+2qNlE+Jv8gcUSJnGhbWNH6n7MRW/sFg8lZQQg4qmsrK/NpUwvVrT6RbMm6O1Ukqf8Ynuo+PpB4e2SX5PSdzMAd5x5bihBliK6Hpt9FjWBITkc6GG9MPsqgv+ntjmB0qukpGOtSfKlWwovmZ9EgqPfZInppuUp+YpQbq2h/SOFXElG55lgBo0mz0d0Fl4q4O3eW3FTPPo44zTeLySK8IoAWRQxcxl6e0NEtvhOnKbpFSxU5kaPE6NF5i/JD5EKL/Zc/5g+l/ENCWyDEMLZ9Qj92RexSsw35YI6VxXNfU79Loyuq1WOuC4gb+N3Rgq0m/2IeDkzG1ngKyxC+bTxmbkAGHs//jRtMmpN54QOM42JXJ23BQSXrn1Lzl9LCW0kHv2D09kza2yrn83JcFX1ZIpxMSgo150ihBV/rrvYyrYTqdj3NNxcbPB+r76ObZjHkheEObzLs80bl8FI4JJFaR8iLxEp18Q4o5tlwpviGP/eFMXIXLOc0csGM565N7Rn3RkHPxKHn/MH7s4MIuhv5/DvjC5zaQs0wT9F6Ye9DB0rciqBYE1h5FiWLoo0Ji+MF8OwhMb8DMQ1KQqVGN+aRtgQPYedBYfe6mVjx8g0lvA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(34020700016)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	TWOL7+KVSDwPJvVWPq5T8YWMqv/FT1N02RoJyhCY5/gndvOtAKsF263XgIs4JOONk6ZNJnsE/umfQigmszEb5VHi859I0xn6Pqkh2v36nw8sGlss+FHXjFRZO5HlUK+DFCIbKLqlO3to0I+Aycv2G4q8tG/T78ycxcRat2o2JdlfAr7eYOa/8VC5a4QWGkZ7CkCT4U+lvFt+2Ww6lF9Vd3kTzZzdN+kY5OXpKdUeu8FqH9mj9DMnhH0WubKj/BUEFcVUT6N1rGLk6ke3nf20t6OEcyVXZW9bCTOORBuKpsYu4vygoFJahgyKhgHIXW6RpKBQs3KtrKJ6OalQHekZk+cXoucXVNil4fuAy64J7LDcNe0LEdBQ91aj++7zcjGxiXY8+OHHBy8dJmuD5Eq+2s9NazMJgaMCRqTAvTTuhyvxi5M6bdYdeDX0SHDa4ZwG
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 09:13:42.1025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 404347ce-437e-4df4-60e5-08de79052a25
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5009
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Mar 2026 09:13:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17190

On 18:58-20260302, Andrew Davis via lists.yoctoproject.org wrote:
> On 3/2/26 5:49 PM, Lannynd, Thorsten wrote:
> > On 3/2/26 4:56 PM, Andrew Davis wrote:
> > > On 3/2/26 2:54 PM, Thorsten Lannynd via lists.yoctoproject.org wrote:
> > > > Add curl-cffi and yt-dlp to the TI_TEST_EXTRAS packagegroup for
> > > > additional testing capabilities.
> > > >=20
> > > > - curl-cffi: Python library for curl-impersonate functionality
> > > > - yt-dlp: Enhanced youtube-dl fork with additional features
> > > >=20
> > >=20
> > > Didn't youtube-dl run into some legal issues.. Could you expand on wh=
at
> > > these "additionaltesting capabilities" will be?
> > >=20
> > These packages enable automated Chromium testing to verify video stream=
s display correctly. Our usage is minimal:
> >=20
> > yt-dlp -g https://player.vimeo.com/video/253905163
> >=20
> > This extracts only the direct CDN URL to Big Buck Bunny (CC-licensed) h=
osted on Vimeo=E2=80=94no downloading occurs via yt-dlp itself. We then use=
 this URL to:
> >=20
> >    - Extract specific frames at known timestamps as golden references
> >    - Validate hardware video decoding and Chromium rendering pipeline
>=20
> A direct URL to a video file does that? This whole list reads like an
> LLM generated response..

Blender provides direct URL to BBB video files. See Links [0] & [1].=20
wget can fetch the video.=20

I don't see a need for yt-dlp.

>=20
> >    - curl-cffi provides the modern TLS/HTTP capabilities required by vi=
deo hosting platforms
>=20
> Yeah, I read the commit message too, this gives me no new information
>=20
> >=20
> > This approach eliminates the need to download, store, and/or host golde=
n reference videos and allows testing with Vimeo directly. We can programma=
tically extract the exact frames needed for validation directly from the so=
urce, ensuring our hardware video decoding and Chromium rendering pipeline =
work correctly.
> >=20
>=20
> "hardware video decoding and Chromium rendering pipeline" LLM generated
> summary of the above LLM generated list, don't waste my time.
>=20
> I just went and asked Claude to write a script to validate my "hardware
> video decoding and Chromium rendering pipeline". It spit out a script
> with these lines near the top:
>=20
> > import yt_dlp
> > from curl_cffi import requests
> > from selenium ..
>=20
> So that would be the real answer I'm looking for, you're adding some
> generated testing script that uses these libraries. You could just
> say that or point me to the script itself.
>=20
> Anyway, what is wrong with hosting some set of reference videos locally?
> Are you planning on randomly picking videos to test against? Otherwise
> having every DUT fetch the same videos from the external web every test
> run is going to be a needless bandwidth hog.
>=20

Agree with Andrew here. Additionally, I have these concerns with
downloading videos on every DUT/Test=20
1. Security risk of these videos containing some malware, since the list
is public and threat actors know the exact URL from where we are
downloading and how we are downloading.=20
2. Licensing risk of using yt-dlp.

If you plan to download the videos then, How are you planning to mitigate t=
hese?

NAK

[0]: https://download.blender.org/peach/bigbuckbunny_movies/
[1]: https://download.blender.org/demo/movies/BBB/

Regards=20
Yogesh=20

