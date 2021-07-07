Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip4a.ess.de.barracuda.com
	(egress-ip4a.ess.de.barracuda.com [18.184.203.227])
	by arago-project.org (Postfix) with ESMTPS id 8855F529FC
	for <meta-arago@arago-project.org>;
	Wed,  7 Jul 2021 08:08:59 +0000 (UTC)
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
	[209.85.216.71]) by
	mx-outbound14-245.eu-central-1a.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 07 Jul 2021 08:09:03 +0000
Received: by mail-pj1-f71.google.com with SMTP id
	r5-20020a17090aad05b02901727bad5ccaso3375815pjq.3
	for <meta-arago@arago-project.org>;
	Wed, 07 Jul 2021 01:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xYDyBHxDTsTckuDfT50uMgk2fJ6ZH6trE8tv/r11rIU=;
	b=UeGADhApTE9D/j74FS5OcEe29jq0D9XZe4Okt+0qkZP8hbQDXKsJBYAf28SNfkj6eX
	PSjiO+RbZaeZiNlRik5Xq1qZv5g5HAdaW0TXBs2YV3FAKaseTzTSuEKYRg4dmnPSC6Dd
	VEMMRrn2QecLFi2zqr8GJVcxpEOqazM/MuNQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xYDyBHxDTsTckuDfT50uMgk2fJ6ZH6trE8tv/r11rIU=;
	b=sEYn8YhiiQkDch3o5T3ZmXk94g/I6yRl6C6anIErl6Ek1MxucTh47kV/4LpvooVBDY
	B0TS0vecVMsbGYN09Z9lUNI/AiIlYpBHZ8aT8mMS4qPtHWAXEBrexno2uXuDGVafAeuE
	0aqw7JswMGxOBBcu3QRJ8jzW5oUUE3RmxBjkJuO17GgBx1ov771ncwdsVH/4xZWzR04I
	HbWIMhrZT8uRVbMDQTgyKX+Ryjn4AVy5I3bNOHaYJrbV1bL/6DI4Gv3iVlUFq4mGZfC/
	BkOcID0+k6MfsujjYCL6f22kJZa8r9YFjGOEfQE1tsH0kwK93KWWbj+w+juL6Cn72eD6
	poOA==
X-Gm-Message-State: AOAM530nRqgZUcBzX3LO7fBM+HdffKSX/218vvNu+kXunUAgWsHq74IE
	pQ2tdKFzVuyyLP/yjYdC0lBoyRh3dj3OsSTFivlaAFt6VQX2aRPAMNIjzcBZK8SqdannI9R38B+
	WkiFpdvtHRuKc27XTnlac0ys5gfZslbdPiJUWO3/+D/j7maUKYGCEe5sQXiFeEekZ26fUWO7chk
	M5
X-Received: by 2002:a62:4e96:0:b029:305:a36c:fc6 with SMTP id
	c144-20020a624e960000b0290305a36c0fc6mr24463768pfb.70.1625645342035;
	Wed, 07 Jul 2021 01:09:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlXPi+crVDxnK/lrjrVm/+te3xecw6nF76Zi5LPLV7CMdLuGrZftL1Zz11N5hevUSme8+T4ExAkbLeqTxXyxE=
X-Received: by 2002:a62:4e96:0:b029:305:a36c:fc6 with SMTP id
	c144-20020a624e960000b0290305a36c0fc6mr24463733pfb.70.1625645341639;
	Wed, 07 Jul 2021 01:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210622134500.87848-1-priya.ns@mistralsolutions.com>
	<20210622134500.87848-2-priya.ns@mistralsolutions.com>
	<20210623030342.gfqtk5onuowbcahp@corporate>
In-Reply-To: <20210623030342.gfqtk5onuowbcahp@corporate>
From: Vigna Raja Priya N S <priya.ns@mistralsolutions.com>
Date: Wed, 7 Jul 2021 08:08:45 +0530
Message-ID: <CAHFpNO-UwFhgi4xLa0MXwvx4GOU-VLE1LzV7RG=z30+YSRSnQw@mail.gmail.com>
To: Nishanth Menon <nm@ti.com>
X-BESS-ID: 1625645342-303829-21305-13058-1
X-BESS-VER: 2019.1_20210706.2354
X-BESS-Apparent-Source-IP: 209.85.216.71
X-BESS-Outbound-Spam-Score: 1.09
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.233441 [from 
	cloudscan21-204.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	1.08 DATE_IN_PAST_03_06_2   META:  
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.01 DATE_IN_PAST_03_06 HEADER: Date: is 3 to 6 hours before Received:
	date 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=1.09 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=DATE_IN_PAST_03_06_2, BSF_BESS_OUTBOUND,
	DATE_IN_PAST_03_06, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status: 1
Cc: meta-arago@arago-project.org, Priya N S <priya.ns@ti.com>,
	Sekhar Nori <nsekhar@ti.com>
Subject: Re: [tisdk-setup-scripts] [master] [PATCH-V2 1/3] create-sdcard.sh: fix regex used for rootfs tarball
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
X-List-Received-Date: Wed, 07 Jul 2021 08:09:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 23, 2021 at 8:33 AM Nishanth Menon <nm@ti.com> wrote:
>
> On 19:14-20210622, Priya N S wrote:
> > From: Priya N S <priya.ns@ti.com>
> >
> > From: Priya N S <priya.ns@ti.com>
> >
> > Filesystem tarballs present in SDK are in the format
> > tisdk-<IMAGE_TYPE>-image-<MACHINE>.tar.xz. This is different from
> > earlier format where 'rootfs' was present in all the filesystem
> > tarball names. Update regex used for filesystem tarball search to
> > use "image" as the keyword.
> >
> > Signed-off-by: Priya N S <priya.ns@ti.com>
> > Signed-off-by: Sekhar Nori <nsekhar@ti.com>
> > ---
> >  create-sdcard.sh | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/create-sdcard.sh b/create-sdcard.sh
> > index 736cd42..264095a 100644
> > --- a/create-sdcard.sh
> > +++ b/create-sdcard.sh
> > @@ -752,10 +752,9 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
> >       BOOTUENV=`ls $BOOTFILEPATH | grep uEnv.txt | awk {'print $1'}`
> >       #rootfs
> >       ROOTFILEPARTH="$PARSEPATH/filesystem"
> > -     #ROOTFSTAR=`ls  $ROOTFILEPARTH | grep tisdk.*rootfs | awk {'print $1'}`
>
> Can we drop this? We should'nt have commented out code.
The commented-out code is already removed from the script.

