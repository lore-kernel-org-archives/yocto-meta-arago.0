Return-Path: <paul.barker.commagility@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by arago-project.org (Postfix) with ESMTPS id E796C52A81
	for <meta-arago@arago-project.org>;
	Wed, 21 Oct 2015 14:03:23 +0000 (UTC)
Received: by wikq8 with SMTP id q8so95335781wik.1
	for <meta-arago@arago-project.org>;
	Wed, 21 Oct 2015 07:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:organization:mime-version:content-type:content-transfer-encoding;
	bh=OSlj0p5h7YTECMMuKvhqVuncCQfYSHmtKzm4BoH2UI4=;
	b=BInpCFXFzUxEhusC7+njVfnQnSuHKlx9zVTEmlfwJ4VM21JdM5n+Nv37AotOnQFnaD
	lx5XPUA4lhE9Upq6XLWAgiiIXax9vo1CA+isJYFYuAWEZriQediZeG3yHVv5Vyc58fLg
	iAkyv8+JV6hQZSQECd54GDbmWHz5oo1oe8xb25e4+3e+iSX0X54fx0/wm2NnJXX2m1F5
	8qCN5jzumZ4VxL3mFZ7DrbCdW69dOH9lHXilI0VS3Yv2xXeGZlp3Si+wIrXmE2xW6zc3
	Bxhzo9N9Uh+qUqA2ApNBRSplMGl//LJsP5618e8HKBIZ6azVXXb3TqAf2GJpqdmXqE+x
	kZxg==
X-Received: by 10.180.186.195 with SMTP id fm3mr35052355wic.1.1445436203023;
	Wed, 21 Oct 2015 07:03:23 -0700 (PDT)
Received: from centos-7 (inno-commagility-ownrouter.lut.ac.uk. [131.231.60.35])
	by smtp.gmail.com with ESMTPSA id
	it4sm10654318wjb.0.2015.10.21.07.03.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Oct 2015 07:03:22 -0700 (PDT)
Date: Wed, 21 Oct 2015 15:03:20 +0100
From: Paul Barker <paul.barker@commagility.com>
To: Denys Dmytriyenko <denys@ti.com>
Message-ID: <20151021150320.3f044d5c@centos-7>
In-Reply-To: <20151021135242.GQ5620@edge>
References: <20151021135037.200001e5@centos-7>
	<20151021135242.GQ5620@edge>
Organization: CommAgility Ltd
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: meta-arago@arago-project.org
Subject: Re: meta-arago Fido branch
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
X-List-Received-Date: Wed, 21 Oct 2015 14:03:24 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 Oct 2015 09:52:42 -0400
Denys Dmytriyenko <denys@ti.com> wrote:

> On Wed, Oct 21, 2015 at 01:50:37PM +0100, Paul Barker wrote:
> > Hi,
> > 
> > There isn't currently a 'fido' branch in the meta-arago repository. I'm now
> > following 'fido' on all other layers, on meta-arago it's unclear whether I
> > should take the commits after the ti2015.01 tag or not.
> > 
> > Would it be possible to add a 'fido' branch?
> 
> Paul,
> 
> meta-arago only tracks stable releases. Currently it's fido:
> http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/README;hb=HEAD
> http://arago-project.org/git/projects/?p=oe-layersetup.git;a=blob;f=configs/arago-fido-config.txt;hb=HEAD
> 

Sorry, looks like I misunderstood this. I'll follow master of meta-arago along
with fido of everything else.

Thanks,

-- 
Paul Barker
CommAgility Ltd

