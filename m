Return-Path: <paul.barker@konsulko.com>
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
	[209.85.210.45])
	by arago-project.org (Postfix) with ESMTPS id 62FE052968
	for <meta-arago@arago-project.org>;
	Tue, 17 Nov 2020 19:17:58 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id 79so20527743otc.7
	for <meta-arago@arago-project.org>;
	Tue, 17 Nov 2020 11:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=ZpnVpfLXmIufA7nacMnR1taaltTrhKJ4u7Wo0OG48Fk=;
	b=q22aDEHiGaQAKG21HNqEGfYVe1yl6cqprZmGdXRpBg+mwbioIx4X6pc2PUncazXH1O
	sJUs2IU2eKnlHHDql82i8t95bTlVy40RSfnctQ/oM3v4JScUdGN0S4LlPa2igOSGqSRN
	dh9Z+1FBqtiKKDC6dMyVEQWnz2yZZncFqAaIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ZpnVpfLXmIufA7nacMnR1taaltTrhKJ4u7Wo0OG48Fk=;
	b=ZAC5xVfXoZSUILLmYz6vcxzWHty/LfOAqYqRGLzataoB3s5ZnyuM/HhOOl63SeaP5I
	a8zU2b75Wbt5PEPBhtHOrOBZIkjC495PZxnUUa2gF0NNJ2LJmgTzjQwznzC/dt9yYw4P
	0Y0unucHz7Vkd1u5r+sG+S5PgSJCqvfXGOLq/1552/eej/WdNc1AGfgIZw6w+NA3Sm/g
	7BoMop0AQ5IewD2axIVX2mj1/EV49qHKqNEFGhE5sCNFiE2qXsRMw/+syQx4/E8xZTAQ
	I9sjA00boGEe2LYLwQtTXqPGNUPQik2+oIryITY2EWtxNXVzDgvy7ihU8EQeYzHQusia
	e2lg==
X-Gm-Message-State: AOAM531WsyVy9uopdmr6U2kHFsBcrYmnbDXP5X98gjyyhBBOKV0+xJXZ
	GKLm0ntSHWwKFA4NDiEGVXLQHGP8InUmd/Lr4NyFjMjoGND/hQ==
X-Google-Smtp-Source: ABdhPJy/P4jTGR+xeAZCfVj0xM2PM50gfaQCc48QJVLFwINeDFUhS5Wj0JUV1dsY2gGYe2z7Ze9NusEy7DM6qTn8sj8=
X-Received: by 2002:a05:6830:831:: with SMTP id
	t17mr4337501ots.92.1605640675870; 
	Tue, 17 Nov 2020 11:17:55 -0800 (PST)
MIME-Version: 1.0
From: Paul Barker <pbarker@konsulko.com>
Date: Tue, 17 Nov 2020 19:17:46 +0000
Message-ID: <CAM9ZRVua_tLGXPZ76A0Su2yzhKD=-=un_G33-UGJbsKAzh0t_w@mail.gmail.com>
To: meta-arago@arago-project.org, meta-ti@lists.yoctoproject.org
Subject: How to tell when meta-ti/meta-arago or TI CoreSDK is released
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Nov 2020 19:17:59 -0000
Content-Type: text/plain; charset="UTF-8"

Hey folks, apologies if this isn't the right place to ask but I can't
see where else I should be asking this question.

The Sancloud BSP layer (meta-sancloud) depends on both meta-arago and
meta-ti. For our Arago builds I typically pin release versions of
these dependency layers, especially for meta-arago and meta-ti I want
to ensure that we're using known good versions. The tag we're
currently pinned to is 07.00.00.005 which I believe corresponds to a
TI CoreSDK release. I see there are some new tags in these layers and
in the ti-linux-kernel repository

I also see that configs have been added to the oe-layersetup
repository which is usually my flag that something has been released.
However, in oe-layersetup both 07.01.00.004 and 07.01.00.005 have been
given config files while the meta-arago layer, meta-ti layer and
ti-linux-kernel recipes are up to 07.01.00.006. So my usual heuristics
are a bit confused.

I've tried searching for "ti coresdk" in google but I can't find any
documentation for this. I've also tried looking at the Arago wiki but
this does not look to have been updated recently. The only list of
branches I can find is
http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment
which is definitely obsolete.

So all I can do is ask the question then - how do I find out when a
release of Arago (or TI CoreSDK) is ready to pick up and use?

To pre-empt the obvious question - we do test with the HEAD of the
dunfell branch of layers regularly but we're not happy to issue a
release of our own BSP without ensuring we're aligned on released
versions of the underlying layers where possible. We need to track the
releases in the ti-linux-kernel layer as we've seen in the past that
our kernel needs to match with the expectations of the meta-ti layer
if we want the PowerVR drivers to work.

Thanks,

-- 
Paul Barker
Konsulko Group

