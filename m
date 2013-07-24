Return-Path: <chgans@googlemail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by arago-project.org (Postfix) with ESMTPS id 07623529B0
	for <meta-arago@arago-project.org>;
	Wed, 24 Jul 2013 02:24:06 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kl13so76230pab.34
	for <meta-arago@arago-project.org>;
	Tue, 23 Jul 2013 19:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=odlPlgcdJ3Yoz3DhSkRRhaGWSrl98e/OW1nUh/9Dq2k=;
	b=f2E0aeBKhl1i/SYIskZVie5Af3l8FhMSgANHbw4jaiQonXN0m28fucMN4QUi4T1z3H
	wy9f+z2JHp5O8UKThc2jfLbGHaAe8356FnqTFm/Ar5TdHZ712UpZrfivsn+hgje88A7z
	Wzjmt2FwoiROp5VW0IuTk+6gwSEIF3xPFAbnnabxv5yMjD7KTlbhPK6OLuilZcxhV4gI
	xEoVYTDEl3kS5TmQvgPqBm1oFzsBodbXFbJRVX9ySE27bBtfLCHU9QLf0bYhu25wJyxy
	xywNjAnQ1rlml/1h4Cl5MCdoRqYECfLFlGCP+o/jJhc2YSWrvW0TDiDhrhAg1EdR+s/J
	/2JA==
X-Received: by 10.68.163.131 with SMTP id yi3mr40019764pbb.55.1374632645809;
	Tue, 23 Jul 2013 19:24:05 -0700 (PDT)
Received: from krys-red.trunet.local ([210.48.94.225])
	by mx.google.com with ESMTPSA id sz6sm48315284pab.5.2013.07.23.19.24.03
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 23 Jul 2013 19:24:04 -0700 (PDT)
Sender: Chris Gagneraud <chgans@googlemail.com>
Message-ID: <51EF3AC0.6080703@gna.org>
Date: Wed, 24 Jul 2013 14:24:00 +1200
From: Christian Gagneraud <chgans@gna.org>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1331708251.407.1374386154381.JavaMail.jenkins@puget>
	<51EDE9D0.2000003@gna.org> <20130723031524.GA30573@edge>
	<51EE0A0A.3020902@gna.org> <20130723060244.GA31158@edge>
In-Reply-To: <20130723060244.GA31158@edge>
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
X-List-Received-Date: Wed, 24 Jul 2013 02:24:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 23/07/13 18:02, Denys Dmytriyenko wrote:
> On Tue, Jul 23, 2013 at 04:43:54PM +1200, Christian Gagneraud wrote:
>> On 23/07/13 15:15, Denys Dmytriyenko wrote:
>>> Christian,
>>>
>>> On Tue, Jul 23, 2013 at 02:26:24PM +1200, Christian Gagneraud wrote:
>>>> Hi there,
>>>>
>>>> I have been looking at these test/build reports recently, is there a
>>>> more detail report available somewhere?
>>>
>>> Yes, but detailed reports are not yet published externally - it's on my
>>> "to do" list.
>>
>> Good to hear, thanks! I have no strong needs for this, i was just
>> curious about the am335x-evm test failures.
>>
>>>
>>>
>>>> As a user of a am335x-evm and a BeagleBoard Black, I would like to
>>>> know more about test failure for the EVM.
>>>
>>> There are some issues with the boot sequence of an automated test - looks
>>> like it's trying to load a wrong kernel image, I'll look into it later.
>>> Otherwise, the latest Dylan build works and boots fine for me on am335x-evm
>>> when loaded manually on SD card.
>>>
>>>
>>>> As well, I'm considering moving from Arago/Danny (kernel 3.2) to
>>>> Arago/Dylan (kernel 3.8?). I would like to know if there are any
>>>> plan to use Dylan for the next stable Arago.
>>>
>>> Actually, Arago/Danny has been using kernel 3.8 for quite some time now - we
>>> already had couple internal releases with it. You would need to specifically
>>> request AM-SDK branding to get 3.2 kernel, as the default is 3.8 in Danny and
>>> in Dylan. The only change Dylan brings is to update the underlying Yocto
>>> framework with all the user-space apps to the latest versions.
>>
>> Yes, that's right, Arago/Danny already use kernel 3.8. My mistake!
>> To be more precise, my question was related to QA stuff. For now,
>> build and test automation are still done with Arago/Danny, any plan
>> to switch to or add Arago/Dylan config?
>
> Yes, indeed - that's the next step. I still need to finish the devkit portion
> of our SDK, but otherwise everything seems to be getting ready to switch the
> nightly builds and tests to using Dylan.

I like it! :)

>
>
>> On the side, any plan to add beaglebone and/or beaglebone-black to
>> the list of machines used by your continuous integration systems?
>
> Starting with kernel 3.8, the only difference between AM335 EVM, EVM-SK and
> Beaglebone is in the devtree. When we build for am335x-evm, we copy all the
> DTBs, so the same images can be used on SK or Beaglebone. No need to build for
> those separately!

I did a build overnight using MACHINE=am335x-evm and yes I'm getting the 
DTBs for the evm, the evmsk and the bone (which supports both white and 
black, through the concept of capes if I'm not wrong).

I managed to boot the EVM from SD-Card (core-image-minimal with 
poky+meta-ti+meta-qt5/Dylan), the only manual thing I had to do so far 
was to rename uImage-am335x-evm.dtb to am335x-evm.dtb, because u-boot 
was expecting it this way.

My deployment on the SD-Card is done with:
cp u-boot.img MLO u-boot-spl.bin uImage $BOOTMNT
tar -C $ROOTMNT -xzvf core-image-minimal-am335x-evm.tar.gz
tar -C $BOOTMNT -xzvf modules--3.8.13-r0-am335x-evm-20130723061944.tgz
umount $ROOTMNT&
sudo cp -a uImage* $ROOTMNT/boot
umount $BOOTMNT&
wait

Unfortunately the modules tarball has no shortcut link, and the name 
contains a double '-' as something was missing:
christiaga@krys-red:~/projects/yocto/poky-ti-qt5/build/tmp/deploy/images$ ls 
-1 *--*
modules--3.8.13-r0-am335x-evm-20130723061944.tgz
uImage--3.8.13-r0-am335x-bone-20130723061944.dtb
uImage--3.8.13-r0-am335x-evm-20130723061944.bin
uImage--3.8.13-r0-am335x-evm-20130723061944.dtb
uImage--3.8.13-r0-am335x-evmsk-20130723061944.dtb

Not such a big deal though.


>
>  From a run-time testing perspective, those are obviously different tests on
> actual boards - I would need to check the board farm for proper setup. BTW,
> current nightly tests are sent to our internal board farm, which is shared. I
> am working on setting up my own personal board farm - I do have all the
> boards, I just need to whip our automation software in shape, which is not an
> easy task...

How much hardware is needed to setup a personal farm? I would be 
interested to have automated build and target test execution.
I started to have a look at tisdk-build-scripts and other stuff like 
jerkins, and having a "test farm" here is definitely on my radar.

>
>
>>>> Also, do you think it is conceivable to hope for a working Qt5 with
>>>> TI OpenGL stuff?
>>>
>>> It's in the plans. Prabu was able to get it built after some massaging, but
>>> there are still few issues. Also, we would need to make sure the fallback
>>> mechanism works for legacy devices w/o GLES, since Qt5 requires it...
>>
>> Interesting! What I found so far:
>>   - https://github.com/prabindh/qt-configs
>>   - http://e2e.ti.com/search/default.aspx#q=qt5&g=29&sc=forum
>>   - and of course https://github.com/meta-qt5/meta-qt5, which depends
>> on oe master :(

Actually meta-qt5 has a Dylan branch as well.

>>
>> What I would like to achieve by the next months is to provide an
>> {arago|angstrom|poxy}-danny-qt5 SDK and custom rootfs to the dev
>> guys. Will see how it goes!
>
> Let us know how it goes. And patches are welcome, as usual!

So far, I built a rootfs with Qt5 libs, the road is still long, long...

Regards,
Chris





