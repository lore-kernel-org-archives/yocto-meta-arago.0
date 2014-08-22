Return-Path: <aja@survision.fr>
Received: from mo69.mail-out.ovh.net (8.mo69.mail-out.ovh.net [46.105.56.233])
	by arago-project.org (Postfix) with ESMTP id AC99452972
	for <meta-arago@arago-project.org>;
	Fri, 22 Aug 2014 06:41:03 +0000 (UTC)
Received: from mail425.ha.ovh.net (gw6.ovh.net [213.251.189.206])
	by mo69.mail-out.ovh.net (Postfix) with SMTP id 766751008B85
	for <meta-arago@arago-project.org>;
	Fri, 22 Aug 2014 08:41:01 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 22 Aug 2014 08:41:00 +0200
Received: from laubervilliers-656-01-35-73.w217-128.abo.wanadoo.fr (HELO
	?192.168.50.78?) (arnaud.janvier@survision.fr@217.128.91.73)
	by ns0.ovh.net with SMTP; 22 Aug 2014 08:40:58 +0200
Message-ID: <53F6E5F9.8000901@survision.fr>
Date: Fri, 22 Aug 2014 08:40:57 +0200
From: Arnaud Janvier <aja@survision.fr>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Matt Schuckmann <Matt.Schuckmann@planar.com>, meta-arago@arago-project.org
References: <4B07ADD556F70043925DA2E9C5D4346D2FD85EA011@MSXBEBVT12.planar.net>
In-Reply-To: <4B07ADD556F70043925DA2E9C5D4346D2FD85EA011@MSXBEBVT12.planar.net>
X-Ovh-Tracer-Id: 16571557779322684539
X-Ovh-Remote: 217.128.91.73
	(laubervilliers-656-01-35-73.w217-128.abo.wanadoo.fr)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeejfedrkeefucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeejfedrkeefucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Subject: Re: i686 binutils failing to build for SDK 7.0 build
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
X-List-Received-Date: Fri, 22 Aug 2014 06:41:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On Tue, Aug 05, 2014 at 10:44:28AM -0700, Matt Schuckmann wrote:
> I'm trying to build a basic image using Arago, SDK 7.0 config
> (configs/amsdk/amsdk-07.00.00.00-config.txt) and binutils 2.20.1 is
> failing to compile for the i686 host system. I'm building on a Ubuntu
> 14.04 32bit VM.
>
> My bitbake command is: MACHINE=am335x-evm;bitbake core-image-minimal
>
> The errors are:
> binutils-native/2.20.1-r9/binutils-2.20.1/bfd/doc/bfd.texinfo:326:
> unknown command `colophon'
> binutils-native/2.20.1-r9/binutils-2.20.1/bfd/doc/bfd.texinfo:337:
> unknown command `cygnus'
>
> It looks like this was a known problem for building binutils that has
> been fixed a long time ago and since SDK 7.0 is released code I would
> have assumed the problem was taken care for the Arago build so I'm a
> little puzzled why I'm getting this now.
>
> Any help would be appreciated.  Thanks, Matt S.
>

Hello Matt,

I have had the same issue with Dylan and have a correction proposal.
I will send the patch to the list right after. Could you apply it and
give us your feedback?

Thanks.

Best regards,
Arnaud Janvier

