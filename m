Return-Path: <chgans@googlemail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by arago-project.org (Postfix) with ESMTPS id DBB4952979
	for <meta-arago@arago-project.org>;
	Tue, 23 Jul 2013 04:44:01 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id y14so7614115pdi.16
	for <meta-arago@arago-project.org>;
	Mon, 22 Jul 2013 21:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Qdiv0o7rlYL839PCfgmk216i6AFSf0wrjZpvxwkQbHo=;
	b=ByvHnCsbdmS83pF1NdN3kkh/NOTNy+GQHZc/xDJ7NsiLECQaTcCMp0rL1Ws7pYcmig
	npbdURrbv+OArG3gV06ZLFLRezjgUIR0u9PQGfXcXZ/blZY29pEkG+YTXJuYH83JBZ1G
	q2DboyKfKNzHdrr1QDSerJr+enbmFBZ2+mNnk+aSc1ySsXjWn/u9cbQM1cBUDGhvl49x
	ytzqEDJ8HFDpF9gJA7ZNjcM3WlLcDpf7SpVBRxQXmMftuyrhmvdq6zYSo4/L9FZ8ibty
	U/X7Yy+7ziGPYXZ6mvD8i+Nab6FKtaigSyrBvq3aL61tERV0RdSJA75UIFTgCDvhkzwP
	r2XQ==
X-Received: by 10.66.25.232 with SMTP id f8mr25374725pag.25.1374554640664;
	Mon, 22 Jul 2013 21:44:00 -0700 (PDT)
Received: from [0.0.0.0] ([210.48.94.225])
	by mx.google.com with ESMTPSA id w8sm6978033paj.4.2013.07.22.21.43.57
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 22 Jul 2013 21:43:59 -0700 (PDT)
Sender: Chris Gagneraud <chgans@googlemail.com>
Message-ID: <51EE0A0A.3020902@gna.org>
Date: Tue, 23 Jul 2013 16:43:54 +1200
From: Christian Gagneraud <chgans@gna.org>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1331708251.407.1374386154381.JavaMail.jenkins@puget>
	<51EDE9D0.2000003@gna.org> <20130723031524.GA30573@edge>
In-Reply-To: <20130723031524.GA30573@edge>
Cc: meta-arago@arago-project.org
Subject: Re: [nightly] Core TISDK 2013.06 build 2013-07-21_01-01-44
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
X-List-Received-Date: Tue, 23 Jul 2013 04:44:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 23/07/13 15:15, Denys Dmytriyenko wrote:
> Christian,
>
> On Tue, Jul 23, 2013 at 02:26:24PM +1200, Christian Gagneraud wrote:
>> Hi there,
>>
>> I have been looking at these test/build reports recently, is there a
>> more detail report available somewhere?
>
> Yes, but detailed reports are not yet published externally - it's on my
> "to do" list.

Good to hear, thanks! I have no strong needs for this, i was just 
curious about the am335x-evm test failures.

>
>
>> As a user of a am335x-evm and a BeagleBoard Black, I would like to
>> know more about test failure for the EVM.
>
> There are some issues with the boot sequence of an automated test - looks
> like it's trying to load a wrong kernel image, I'll look into it later.
> Otherwise, the latest Dylan build works and boots fine for me on am335x-evm
> when loaded manually on SD card.
>
>
>> As well, I'm considering moving from Arago/Danny (kernel 3.2) to
>> Arago/Dylan (kernel 3.8?). I would like to know if there are any
>> plan to use Dylan for the next stable Arago.
>
> Actually, Arago/Danny has been using kernel 3.8 for quite some time now - we
> already had couple internal releases with it. You would need to specifically
> request AM-SDK branding to get 3.2 kernel, as the default is 3.8 in Danny and
> in Dylan. The only change Dylan brings is to update the underlying Yocto
> framework with all the user-space apps to the latest versions.

Yes, that's right, Arago/Danny already use kernel 3.8. My mistake!
To be more precise, my question was related to QA stuff. For now, build 
and test automation are still done with Arago/Danny, any plan to switch 
to or add Arago/Dylan config?

On the side, any plan to add beaglebone and/or beaglebone-black to the 
list of machines used by your continuous integration systems?

>
>
>> Also, do you think it is conceivable to hope for a working Qt5 with
>> TI OpenGL stuff?
>
> It's in the plans. Prabu was able to get it built after some massaging, but
> there are still few issues. Also, we would need to make sure the fallback
> mechanism works for legacy devices w/o GLES, since Qt5 requires it...

Interesting! What I found so far:
  - https://github.com/prabindh/qt-configs
  - http://e2e.ti.com/search/default.aspx#q=qt5&g=29&sc=forum
  - and of course https://github.com/meta-qt5/meta-qt5, which depends on 
oe master :(

What I would like to achieve by the next months is to provide an 
{arago|angstrom|poxy}-danny-qt5 SDK and custom rootfs to the dev guys. 
Will see how it goes!

Regards,
Chris




