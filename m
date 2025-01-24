Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC0CC02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 21:54:40 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.4526.1737755678310517565
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 24 Jan 2025 13:54:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IBnwU42O;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50OLsZe1616087
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 24 Jan 2025 15:54:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737755675;
	bh=qw8y4TVzczCrdXmv0LT9k6nGwEOQiFKjjPMI/jDWCmc=;
	h=Date:To:CC:Subject:From;
	b=IBnwU42OHg7Xw5C0S3MTnt3MYGJXTHtq5Z9YJ7tLbW33V8AC8LpNQ11HmKtBF44pR
	 oncoDmX08rz03AG2dt3G9hgBS56WF5yJPriLCf3W4HiXkspeQi3i1WhM+b3eJNYaz5
	 1ze4LXhHM/lM7P7naaV0+Wpycb1XmIHO597aj8Gc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50OLsZDx091574;
	Fri, 24 Jan 2025 15:54:35 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 24
 Jan 2025 15:54:35 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 24 Jan 2025 15:54:35 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50OLsZ36091288;
	Fri, 24 Jan 2025 15:54:35 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 24 Jan 2025 15:54:35 -0600
Message-ID: <D7AMZ4EPPP5M.2NTHC4Y4JP2H7@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <afd@ti.com>, <c-shilwant@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][discussion] Qt package groups and config
 locations
From: Randolph Sapp <rs@ti.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 24 Jan 2025 21:54:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15762

Hey,

Asking for some general advice before I submit the next series. Cleaning up
meta-qt* package groups and everything there is a bit of a logistical argum=
ent
to be made.

We now have an official requirement tracking Qt6 enablement which means mor=
e
automated testing. At the same time I do not think meta-arago should be
inherently dependent on a layer as heavy as meta-qt*. I'm planning on makin=
g a
series of isolated package groups and configs that can be toggled through a
distro feature.

Where do we think this should belong? The distro layer or the extras layer?=
 I'm
leaning toward the distro layer as these are ultimately distro specific con=
figs,
but I can understand that some may believe this is inherently "extra" conte=
nt.
Regardless, the test layer will need to be updated to point to this.

Maybe it should be a generic "software" layer? I don't like splitting thing=
s
unnecessarily, but this is a weird example where we need certain features
enabled for both testing and release, but it doesn't really make sense to
duplicate it. No clue. Any opinions?

Regards,
Randolph

