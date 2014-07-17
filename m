Return-Path: <b.hutchman@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by arago-project.org (Postfix) with ESMTPS id 274FA529DD
	for <meta-arago@arago-project.org>;
	Thu, 17 Jul 2014 13:30:13 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id c1so6099649igq.7
	for <meta-arago@arago-project.org>;
	Thu, 17 Jul 2014 06:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=HUnrNFDbO7LxBH9y8uZBsJVQafwoLR3ViizGu3F+1iE=;
	b=riecZskgye6e/+f5+AxtRi3hW9RND5uO7jW759SWxDtDtXKZCK5z6pNVs1IpFGLBGP
	GVxQoSDfEwNiFaRaTzvMlnAThJbP/kr8FhH8202BCk00cr+9u0VpgazpXK0jApOaTTQS
	sU37bZbwBFqrXpvCDZ5mamCLL40RObBUiQjMM9s7IIYDo/E38tKhpoaU3dl6CkraBfee
	bXgtskEZLd8wucL6fF9SgRDBmjXVi35u/eO5g83nHDrsWn7Kij7MCk2KVUkE4OM3+Zrd
	Tvq/LpC08cvKh1pC3lst7/Vrcq804QaNUkm8Xos2T9+2B2etDui9lg+MQVWLqoaLtjPZ
	Phlg==
MIME-Version: 1.0
X-Received: by 10.60.34.225 with SMTP id c1mr5150675oej.14.1405603811529; Thu,
	17 Jul 2014 06:30:11 -0700 (PDT)
Received: by 10.60.124.234 with HTTP; Thu, 17 Jul 2014 06:30:11 -0700 (PDT)
In-Reply-To: <CAFZh4h8Z2Hn-e1gA+EZ8UunYsSadTAjii+NDjD27ay_kR_v_NA@mail.gmail.com>
References: <CAFZh4h8Z2Hn-e1gA+EZ8UunYsSadTAjii+NDjD27ay_kR_v_NA@mail.gmail.com>
Date: Thu, 17 Jul 2014 09:30:11 -0400
Message-ID: <CAFZh4h9=Tfyh98+P-eL=fvJdfbzimi2kmJNYC0i+x4X8MsyeDA@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: meta-arago@arago-project.org
Subject: Re: New Arago - am180x-evm core-image-minimal build is getting MD5 LICENSE errors in daisy
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
X-List-Received-Date: Thu, 17 Jul 2014 13:30:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

No ARM9 folks on here?

On Fri, Jul 11, 2014 at 4:34 PM, Brian Hutchinson <b.hutchman@gmail.com> wrote:

> So what I did is edit
> tisdk/sources/meta-arago/meta-arago-extras/recipes-core/meta/external-arago-toolchain.bb
> and replaced the LICENSE md5 with the value it calculated in the error
> above and that fixed it.  So not sure if a recipe is busted or if I
> hosed up something somehow but I thought I'd ask about it.
>
> So what is the story with ARM9 AM1808?  Can I use Linaro toolchain yet
> or is there still some compatibility issue that is best if I use the
> Arago 2011.09?
>
> Thanks for any ideas/pointers.
>
> Regards,
>
> Brian

