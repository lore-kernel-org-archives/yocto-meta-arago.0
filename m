Return-Path: <chgans@googlemail.com>
Received: from mail-pb0-f44.google.com (mail-pb0-f44.google.com
	[209.85.160.44])
	by arago-project.org (Postfix) with ESMTPS id 3F4A252A4D
	for <meta-arago@arago-project.org>;
	Fri, 12 Jul 2013 00:19:53 +0000 (UTC)
Received: by mail-pb0-f44.google.com with SMTP id uo1so8412507pbc.3
	for <meta-arago@arago-project.org>;
	Thu, 11 Jul 2013 17:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=HJAva1dL0WSAVFuNGq4gNdMB3l8yqHVxGPKCwyAXCik=;
	b=yCfze47lxK0zV51/uD8iAs6UyO3MX3EK54NuudbMRjpHqPt42pLdJSVJ4vga5dOodf
	Qnh5M3NA04KD7BJRVCN81vA1VIX4xQdroOLQgWJJkb1rM4IiTHFUspBVJ2MSSVu5/83d
	AX0sbjzIcXnsiNqaF63kZCARFcVRG3Kaf+t2cFWPrH9bXF+7ucYiQEFWQNvsDyjEtlAp
	4Z0X+UuzzypDCltFvcEE/b3ZelgHofMToK9NIbyJfqjc+hRa8SfkjDP7aqgG9OqgE9a6
	C4b9KlLQcKwNlXWNp4RPC2g2RAuncbluRmRVlEL/CJ4MJHBwAHLmrwm2MH/uFYBdkC2T
	A0sw==
X-Received: by 10.66.26.20 with SMTP id h20mr38146596pag.180.1373588392290;
	Thu, 11 Jul 2013 17:19:52 -0700 (PDT)
Received: from krys-red.trunet.local ([210.48.94.225])
	by mx.google.com with ESMTPSA id x8sm42015241pbb.39.2013.07.11.17.19.49
	for <meta-arago@arago-project.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 11 Jul 2013 17:19:50 -0700 (PDT)
Sender: Chris Gagneraud <chgans@googlemail.com>
Message-ID: <51DF4BA2.7080408@gna.org>
Date: Fri, 12 Jul 2013 12:19:46 +1200
From: Christian Gagneraud <chgans@gna.org>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: meta-arago@arago-project.org
References: <51DF4A26.6070407@gna.org>
In-Reply-To: <51DF4A26.6070407@gna.org>
Subject: ofono broken with arago-danny-config (was Re: qt4-embedded-gles broken with arago-danny-config)
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
X-List-Received-Date: Fri, 12 Jul 2013 00:19:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Fixing the mail subject. Sorry about that.

Chris

On 12/07/13 12:13, Christian Gagneraud wrote:
> Hi there,
>
> I've just updated my build env today because connman wouldn't compile
> due to unmet dependencies on ofono (needed bluez >=4.99, had 4.98),
> and now it is solved, good!
> Note: I updated my existing build env using "./oe-layertool-setup.sh
> -f configs/arago-danny-config.txt"
>
> But now qt4-embedded-gles is broken:
> christiaga@krys-red:~/projects/yocto/arago/build$ bitbake connman
> ERROR: Unable to parse
> /home/christiaga/projects/yocto/arago/sources/meta-arago/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.4.bb
> Traceback (most recent call last):
> [...]
> OSError: [Errno 2] No such file or directory:
> '/home/christiaga/projects/yocto/arago/sources/oe-core/meta/recipes-qt/qt4/qt4-4.8.4.inc'
>
> it seems that qt4-embedded-gles has been bumped to 4.8.4, but oe-core
> is still at Qt 4.8.3.
>
> Then I realised, that I should as well update my arago build env using
> git pull, and re-run ./oe-layertool-setup.sh, which I did, and now I'm
> back on ofono/bluez unmet dependency...
>
> I tried to clean bluez4, connman and ofono and bitbake connman again,
> but i get the same error while configuring ofono:
> [...]
> Requested 'bluez >= 4.99' but version of BlueZ is 4.98
> | configure:13104: error: Bluetooth library >= 4.99 is required
> [...]
>
>
> Am I missing something or is Arago temporary broken in that respect?
>
> Thx,
> Chris


