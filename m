Return-Path: <b.hutchman@gmail.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by arago-project.org (Postfix) with ESMTPS id ED16D52972
	for <meta-arago@arago-project.org>;
	Thu, 17 Jul 2014 21:08:09 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id m1so1585200oag.19
	for <meta-arago@arago-project.org>;
	Thu, 17 Jul 2014 14:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=uLhCi10O4oqqHyNUwhRN8VK5t/BnzramEYwSRwfTJxU=;
	b=q8vwTWpjkbgTGiLyEjgvGl6XB1KY/GkGAoWfrbqY+VByxD86hj4ADKmjhYW7nIP7Zm
	7qD0ZLlNNLlpdyb2Y8ywKo1T0xpzgx8JFfvFtimxJyQauluV1IvoVaiQ0qLwDjEHZSQf
	OuKZ7tEcgSnFeOxHRFSngZ68QmOgxQ7B0o5SajMRGywLMkvNsvy8EiP5rbCVnYgk7Ai1
	CniEVu3Ak6IN5ZQlxLqcbeIyJ8cYXH3mWHKe0Rh19HrlUNFQOctX26rNqZZEsWc6t7gn
	h6lN3RQfW4dqjw0cS218tf+5Hmd0deEhXldYSZdng+938GgnqZ1uz1S7li54mkShhWB4
	WS9g==
MIME-Version: 1.0
X-Received: by 10.60.118.38 with SMTP id kj6mr8695294oeb.68.1405631289207;
	Thu, 17 Jul 2014 14:08:09 -0700 (PDT)
Received: by 10.60.124.234 with HTTP; Thu, 17 Jul 2014 14:08:09 -0700 (PDT)
In-Reply-To: <CAFZh4h_MTuZtV2e2C3Ctsqw=G=ynfGr-7K7gJ8A+NLhqOCTEaQ@mail.gmail.com>
References: <CAFZh4h8Z2Hn-e1gA+EZ8UunYsSadTAjii+NDjD27ay_kR_v_NA@mail.gmail.com>
	<CAFZh4h9=Tfyh98+P-eL=fvJdfbzimi2kmJNYC0i+x4X8MsyeDA@mail.gmail.com>
	<20140717205217.GW15788@edge>
	<CAFZh4h_MTuZtV2e2C3Ctsqw=G=ynfGr-7K7gJ8A+NLhqOCTEaQ@mail.gmail.com>
Date: Thu, 17 Jul 2014 17:08:09 -0400
Message-ID: <CAFZh4h9E4y7GD5KosZytwz2dPTLJoyEpcdGPksuecu7GT4RFEg@mail.gmail.com>
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
X-List-Received-Date: Thu, 17 Jul 2014 21:08:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 17, 2014 at 5:02 PM, Brian Hutchinson <b.hutchman@gmail.com> wrote:
> I build everything using Yocto 1.5 last year and remember having
> issues building 3.12 with the toolchain built by Yocto.  If I remember
> correctly, use used rootfs built for am1808 using the toolchain in
> Yocto 1.5 and the davinci kernel I used had to be built with the
> arago-2011.09 toolchain.

I need to clarify that a bit ... building the kernel wasn't the
problem ... running it was the problem.  It ran but we saw weird
things and building with a different toolchain appeared to fix it.
I've been bit by similar toolchain issues on or Cortex A8 part too
(it's because we are still on 2.6.37 but I'm working on getting
mainline to work).

B

