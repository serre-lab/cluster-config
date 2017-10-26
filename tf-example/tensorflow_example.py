import tensorflow as tf

a = tf.random_uniform([4, 10000])
b = tf.random_uniform([4, 10000])
c = a + b
res = tf.reduce_sum(c)

with tf.Session(config=tf.ConfigProto(log_device_placement=True)) as sess:
    print("Result is {}".format(sess.run(res)))
