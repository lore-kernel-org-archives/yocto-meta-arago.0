Return-Path: <raj.khem@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by arago-project.org (Postfix) with ESMTPS id 8C4A2529DA
	for <meta-arago@arago-project.org>;
	Mon, 19 Aug 2013 05:57:13 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id xn12so4444342obc.20
	for <meta-arago@arago-project.org>;
	Sun, 18 Aug 2013 22:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=bClYvLzULiRDkxi0p1vtgOE4zO3yHUpbUhCecnrIdsc=;
	b=R98w2GaHZ6VPmFhlrKoZmKeWCWTjwjpShVUwiZzhL42/55HlnqN7EQmeyFF3bm1+bv
	QNerzZaka9P/R19wfNSILuj3ZkliMfRzEkeCLng0Iors2MwweerZnPS97Weuok/CWTJt
	/e6Dhp2Ijo01xnSCBNoMRGLokyJI7JFtJta+gg4WKFR2581yqdYGpN11rh0sZgafgRm4
	rW2NTmnF5ffZyXTVwCb22lXPiBpC+hHmIZ4h//cgydIQrLJGRp+Mx+ymKQFaN1KAhhRX
	+rUMeGp14S2IMceOIl9voSP7YX+g7RTfiBJZIefIwctLdd97H8vwoR4FXieWnB3F7tWN
	yVog==
X-Received: by 10.50.92.74 with SMTP id ck10mr3502746igb.3.1376891832676; Sun,
	18 Aug 2013 22:57:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.216.195 with HTTP; Sun, 18 Aug 2013 22:56:41 -0700 (PDT)
In-Reply-To: <5211B27F.9070707@gna.org>
References: <5211843D.5060805@gna.org>
	<99393E6E-364E-486D-AAB3-6EB66BB9BF72@gmail.com>
	<5211B27F.9070707@gna.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 Aug 2013 22:56:41 -0700
Message-ID: <CAMKF1soEJjWp5o8fa9kFCMWnrFH2pw5Kv6kS1cycv4kgF3d+Aw@mail.gmail.com>
To: Christian Gagneraud <chgans@gna.org>
X-Mailman-Approved-At: Mon, 19 Aug 2013 17:24:50 +0000
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Re: [yocto] GCC SVN repo too slow?
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
X-List-Received-Date: Mon, 19 Aug 2013 05:57:14 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 18, 2013 at 10:51 PM, Christian Gagneraud <chgans@gna.org> wrote:
> Right now, I'm really stuck. The only solutions I can think of are:
> - Ask kindly Arago not to use GCC code from SVN, or maybe to upload an
> archive on yocto/oe mirrors.
> - Check with GNU/GCC guys if they can do something about it (maybe it's a
> temporary issue with their server)
> - Wait and see, cross my fingers. :(

all of above. If someone has the archive. Please let us know we can
populate it on one of
the sourcemirrors.

