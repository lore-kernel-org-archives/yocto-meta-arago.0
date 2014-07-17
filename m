Return-Path: <b.hutchman@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by arago-project.org (Postfix) with ESMTPS id 3F2AF52976
	for <meta-arago@arago-project.org>;
	Thu, 17 Jul 2014 21:16:58 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id n16so1617093oag.41
	for <meta-arago@arago-project.org>;
	Thu, 17 Jul 2014 14:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xM4q3c91+r2UeLwjxH4VFTlppg4ETc7od2OWXo6gdEc=;
	b=rBIW8O2R4ppGFVgWtDMa9vLjghGR2aVsQfD0DMHDq8WJbjqCDxQYlmMLi7LOVv+eDj
	fplsYx88DMPsIZ5tr1EQhOtNQrw9aDw2RYmG/d7HfFkdegwaJTk0SVuWh+djVARfnJyS
	kbC5QgvFINV5UAGGkKhCpiyldGBkzolzt7BYsdfIqVcuhOtdgdCcFaJrZZ7QfKm+zrfS
	DIPKq8QbpFxUOrEZelKaPI7j7MFzlqM95ii/DvuDY1mY10Nwvjd/ek/RZH19eujJk8rF
	MtX8h3hnhio4K/URvCzgdQqWnNHP6GadcBOyWPiebCu5qhZBw7f40ioxdM/Smw6r0Ijx
	fdPw==
MIME-Version: 1.0
X-Received: by 10.60.43.196 with SMTP id y4mr61989oel.44.1405631817601; Thu,
	17 Jul 2014 14:16:57 -0700 (PDT)
Received: by 10.60.124.234 with HTTP; Thu, 17 Jul 2014 14:16:57 -0700 (PDT)
In-Reply-To: <20140717210734.GA15788@edge>
References: <CAFZh4h8Z2Hn-e1gA+EZ8UunYsSadTAjii+NDjD27ay_kR_v_NA@mail.gmail.com>
	<CAFZh4h9=Tfyh98+P-eL=fvJdfbzimi2kmJNYC0i+x4X8MsyeDA@mail.gmail.com>
	<20140717205217.GW15788@edge>
	<CAFZh4h_MTuZtV2e2C3Ctsqw=G=ynfGr-7K7gJ8A+NLhqOCTEaQ@mail.gmail.com>
	<20140717210734.GA15788@edge>
Date: Thu, 17 Jul 2014 17:16:57 -0400
Message-ID: <CAFZh4h8V-0THCDvDzyMZnhYu=gUW4Ofa9Rjc9jc2r62wxGbY+g@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Thu, 17 Jul 2014 21:16:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 17, 2014 at 5:07 PM, Denys Dmytriyenko <denys@ti.com> wrote:

>
> TOOLCHAIN_TYPE=internal will build the toolchain from sources.
>
>
>> I build everything using Yocto 1.5 last year and remember having
>> issues building 3.12 with the toolchain built by Yocto.  If I remember
>
> Hmm, not sure about the issues with the upstream toolchain. Another option
> would be to use Linaro toolchain - either external or internal. The only catch
> is that Linaro is not directly targeting or supporting ARM9 platforms. So, any
> support requests would have to go to upstream GCC.
>

Ah, now I'm with you.  So if I set TOOLCHAIN_TYPE=internal, is it
building the same toolchain that would be built if I had used Yocto
(upstream gcc I'm assuming although I admit I never dug into it) or
something else?

Should I try again with the latest external Linaro?  Just wondering
what may be the best option since I've been out of the ARM9 scene for
a while but now have to update a bunch of our stuff for a new release.

Sorry for the 21 questions ... just trying to stay out of the weeds.

Regards,

Brian

