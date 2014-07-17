Return-Path: <b.hutchman@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by arago-project.org (Postfix) with ESMTPS id 8C14152972
	for <meta-arago@arago-project.org>;
	Thu, 17 Jul 2014 20:54:09 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id j17so1612845oag.12
	for <meta-arago@arago-project.org>;
	Thu, 17 Jul 2014 13:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=f6mqLspfZfi0xUkiaPJDVvPhK334+W0+HQXXHKfWF7o=;
	b=kxXI7FHcV1Vpnyi9bTlh6zOghH6AC2gMy78QWbTcYFNDfTyc7BZ33Xh82Buh0k7jtR
	5Ek8z9JciQNUFWPaUqgv4ET+zkqF9nWCsR21pX2uSXuUDzV0srbesOhM9V+Bf4bwinoY
	KuEEM+yDaAcB122dMhy6bRIUXB8JNI2aRvK/rETZYNb4SFNRTVyPZ/pZhs6xjg15cNji
	7IBgJfR08lLEEajp5nyZCCMuNVF/jKGed54MsiB6lFbBBflnKykwfM5WI2Hu32S7rbA/
	uR81m7mGsb/KOAhMVYA5AVKOpiCSg7PNZoojvLGtqxVWKPzoYz77i77hI+Y5MDAyKMkS
	3EqA==
MIME-Version: 1.0
X-Received: by 10.182.241.130 with SMTP id wi2mr49180634obc.27.1405630448360; 
	Thu, 17 Jul 2014 13:54:08 -0700 (PDT)
Received: by 10.60.124.234 with HTTP; Thu, 17 Jul 2014 13:54:08 -0700 (PDT)
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6E4B7C@DFLE08.ent.ti.com>
References: <CAFZh4h8Z2Hn-e1gA+EZ8UunYsSadTAjii+NDjD27ay_kR_v_NA@mail.gmail.com>
	<CAFZh4h9=Tfyh98+P-eL=fvJdfbzimi2kmJNYC0i+x4X8MsyeDA@mail.gmail.com>
	<8F29D6B095ED194EA1980491A5E029710C6E4B7C@DFLE08.ent.ti.com>
Date: Thu, 17 Jul 2014 16:54:08 -0400
Message-ID: <CAFZh4h8gkn=P-g0bqjo094Z3xgFqiigU7zPOqfpOjTMGVoCAZg@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
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
X-List-Received-Date: Thu, 17 Jul 2014 20:54:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 17, 2014 at 4:45 PM, Cooper Jr., Franklin <fcooper@ti.com> wrote:
> Honestly I don't know how many people are still using am18x in the latest maintenance branches/master. The last TI SDK that used am18x was based on danny.
> If you used oe-layersetup I would also recommend using either the danny config or the amsdk-06.00.00.00-config.txt. With that you should be able to get something working.
> The last TI supported kernel for am18 is rather old (2.6.37) and I think some programs like newer udev had issues with such an old kernel so it might take a bit of work to get that working with the latest maintenance branches.
>
> The current external Linaro toolchain used in Arago does not support ARM9. The Arago toolchain is your best bet.
>

arago-2011.09 is what I've been using but didn't know if there has
been any update to this.  It's not like you can browse
http://downloads.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain to see
what's out there.  If you don't know the name you can't get anything
from there.

I've been using 3.12 kernel from davinci with latest rootfs.

Thanks,

Brian

