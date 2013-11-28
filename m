Return-Path: <ebutera@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by arago-project.org (Postfix) with ESMTPS id 056B1529E3
	for <meta-arago@arago-project.org>;
	Thu, 28 Nov 2013 08:20:19 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id j17so8906659oag.28
	for <meta-arago@arago-project.org>;
	Thu, 28 Nov 2013 00:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=XqZl/8Aq+J73yghS1JCHYPqIsGqereUts5jgvmwgTNU=;
	b=PjDlVcA3Y0vQnry7jQgIPfHPZ86f3o5obezvFEb9t3kBjqUGY+W2P59EvHFJQZXwFD
	co5bezDJbMaSfcbwDz+tUCbXAD1Y1tc+KielGj9F3zSIPDDq1jDBMQXuCO3TugNaCU/v
	OpVTAnBroN39EEMqlnb20S1jWINEv8oeF6kXvx4U6hZnogpvVAKVNDafOC3zo57kAlyb
	ZYbl7G1HrXKQtyUEcWOJpnIT5wscQ25FMS9roTTpb/izC8lVQ3ET571CCgPW1nlHDPe4
	RdlNdvz+PgvjNK7up47hYq9KHTsCqhwElsQEp3iQX88xhhavxt1qnJmEty6zdi51NIXw
	BoYg==
MIME-Version: 1.0
X-Received: by 10.60.58.71 with SMTP id o7mr68604oeq.51.1385626819431; Thu, 28
	Nov 2013 00:20:19 -0800 (PST)
Sender: ebutera@gmail.com
Received: by 10.182.85.97 with HTTP; Thu, 28 Nov 2013 00:20:19 -0800 (PST)
In-Reply-To: <20131127165525.GC690@edge>
References: <1383800614-31915-1-git-send-email-sam.nelson@ti.com>
	<7D46E86EC0A8354091174257B2FED1015983FDC3@DLEE11.ent.ti.com>
	<20131120152449.GC29952@edge>
	<CA+2YH7s5kRhh6t-pBgk_2XjiMOp1Jf2XxKQwLKQa2qW6VcY9sg@mail.gmail.com>
	<20131127165525.GC690@edge>
Date: Thu, 28 Nov 2013 09:20:19 +0100
X-Google-Sender-Auth: JHsuucEx1V_4Tj-8O8Qds-rNDJU
Message-ID: <CA+2YH7u1Ufu4RJRKdCeg66F=_5upz3U5QqgsJzsi0kxSvFHJPA@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v2] cmem: Adding New recipe for cmem
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
X-List-Received-Date: Thu, 28 Nov 2013 08:20:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 27, 2013 at 5:55 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Tue, Nov 26, 2013 at 01:56:56PM +0100, Enrico wrote:
>> On Wed, Nov 20, 2013 at 4:24 PM, Denys Dmytriyenko <denys@ti.com> wrote:
>> > I'd like to see other parts of linuxutils modularized, but that can be done on
>> > as needed basis for any of the new platforms when they require those. We can
>> > keep the old linuxutils around for a little longer, but it can only be used on
>> > the old 35x and 37x plaftorms only and there are many other components (like
>> > SGX) removing support for those old platforms already...
>>
>> Please keep the linuxutils recipe until it can be replaced with the
>> modularized ones, it's useful for 35x and 37x dsp (gstreamer_ti).
>
> Enrico,
>
> Thanks, I'll keep it around for now.
>
> Can you please clarify which kernel you use for 35x and 37x platforms? And
> whether you use the latest versions of other components?

In production i'm using mainline kernel 3.2 with some custom patches
(not related to dsp components, see my github at [1]), with unmodified
components from meta-ti (i'm not using meta-arago).

I'm testing now with kernel 3.12, unmodified components from meta-ti,
gcc 4.8.something (angstrom 2013.12), the components need some
patching but it was really easy to fix them. I don't remember right
now what were the components i needed to fix but i'm sure about cmem
and dsplink.

Right now the most important feature i'm missing is devicetree
bindings for omap3isp.

> The problem with keeping old components around is that they quickly lose
> compatibility with kernel, toolchain, udev etc. that we use these days and it
> doesn't make much sense to carry them indefinitely w/o updating or replacing.

I think there are still many users of the omap dsp stuff. I understand
that TI doesn't want to put resources on "old" platforms (even if they
are still in production and not declared obsolete) but do you think it
could be possible to have some help when those kind of problems
happen?
For example if i have a problem with dsplink and i'm not able to fix
it, asking for help in meta-ti will be useful? (i'm speaking about
someone in a TI dev team that already knows the code).

Enrico

[1]: https://github.com/ebutera/meta-igep/blob/master/recipes-kernel/linux/linux_3.2.bb

